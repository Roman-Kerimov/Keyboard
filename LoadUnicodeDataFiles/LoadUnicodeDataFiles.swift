//
//  LoadUnicodeDataFiles.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    let columnSeparator: Character = ";"
    let commentMarker: Character = "#"
    
    static var ordersByCodePoints: [String: Int] = [:]
    
    override func main() {
        
        let sqLiteSourceURL = UnicodeData.default.persistentStoreDescriptions.first!.url!
        
        let sqLiteTargetURL = URL(fileURLWithPath: CommandLine.arguments[1])
            .appendingPathComponent(UnicodeData.default.name).appendingPathExtension(sqLiteSourceURL.pathExtension)
        
        if loadedVersion != currentVersion || !FileManager.default.fileExists(atPath: sqLiteTargetURL.path) {
            UnicodeData.default.resetPersistentStore()
        }
        
        guard UnicodeData.default.itemCount == 0 else {
            return
        }
        
        var emojiCharacterSet: CharacterSet = .init()
        var fullyQualifiedEmoji: String = ""
        
        for dataItem in UnicodeDataItem.allCases {
            
            guard !isCancelled else {
                return
            }
            
            switch dataItem {
                
            case .emojiTest:
                dataItem.parse { (string) in
                    
                    let components = string.split(maxSplits: 2, omittingEmptySubsequences: false) { [columnSeparator, commentMarker].contains($0) } .map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    let unicodeScalars = components[0].components(separatedBy: .whitespaces).map {$0.hexToUnicodeScalar!}
                    
                    if unicodeScalars.count == 1 {
                        emojiCharacterSet.insert(unicodeScalars.first!)
                    }
                    
                    let codePoints: String = unicodeScalars.map {$0.description} .reduce(.init(), +)
                    
                    switch components[1] {
                    case "component", "fully-qualified":
                        let name: String = components[2].components(separatedBy: String.space).dropFirst(2).joined(separator: .space).description.trimmingCharacters(in: .whitespaces)
                        
                        UnicodeData.default.addItem(codePoints: codePoints, name: name)
                        LoadUnicodeDataFiles.ordersByCodePoints[codePoints] = UnicodeData.default.itemCount
                        
                        fullyQualifiedEmoji = codePoints
                        
                    case "minimally-qualified", "unqualified":
                        AnnotationsXMLParser.toFullyQualifiedDictionary[codePoints] = fullyQualifiedEmoji
                        
                    default:
                        fatalError()
                    }
                }
                
            case .derivedName:
                dataItem.parse { (string) in
                    
                    let components = string.split(separator: columnSeparator).map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    guard components.count == 2 else {
                        return
                    }
                    
                    guard let unicodeScalar = components.first?.hexToUnicodeScalar else {
                        return
                    }
                    
                    guard !emojiCharacterSet.contains(unicodeScalar) else {
                        return
                    }
                    
                    UnicodeData.default.addItem(codePoints: unicodeScalar.description, name: components.last!)
                }
                
            case .annotations, .annotationsDerived:
                dataItem.parse(using: AnnotationsXMLParser.self)
            }
        }
        
        AnnotationsXMLParser.toFullyQualifiedDictionary = .init()
        
        try! UnicodeData.default.backgroundContext.save()
        
        try? FileManager.default.removeItem(at: sqLiteTargetURL)
        try! FileManager.default.copyItem(at: sqLiteSourceURL, to: sqLiteTargetURL)
        
        loadedVersion = currentVersion
    }
    
    private var currentVersion: String {
        return Bundle.main.executableURL!.creationDate!.description
    }
    
    private let loadedVersionKey = "rBNkEMNHcuYIU3bttg2lYblKGlClU7z"
    var loadedVersion: String {
        get {
            return UserDefaults.standard.string(forKey: loadedVersionKey) ?? .init()
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: loadedVersionKey)
            UserDefaults.standard.synchronize()
        }
    }
}

extension String {
    static let space = " "
    
    var hexToUInt32: UInt32? {
        var output: UInt64 = 0
        
        if Scanner.init(string: self).scanHexInt64(&output) {
            return .init(output)
        }
        else {
            return nil
        }
    }
    
    var hexToUnicodeScalar: Unicode.Scalar? {
        
        guard let codePoint = hexToUInt32 else {
            return nil
        }
        
        return Unicode.Scalar.init(codePoint)
    }
}

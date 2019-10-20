//
//  LoadUnicodeDataFiles.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    let columnSeparator: Character = ";"
    let commentMarker: Character = "#"
    
    private func collectFileGarbage() {
        let fileGarbageURLs: [URL] = [
            URL.applicationSupport.appendingPathComponent(String(UnicodeDataItem.derivedName.name.dropLast(4))),
            URL.applicationSupport.appendingPathComponent(String(UnicodeDataItem.emojiTest.name.dropLast(4))),
            URL.applicationSupport.appendingPathComponent("UDFCache"),
        ]
        
        fileGarbageURLs.forEach {try? FileManager.default.removeItem(at: $0)}
    }
    
    private var processedFileCount: Int = 0 {
        didSet {
            let progress: Float = .init(processedFileCount) / .init(UnicodeDataItem.totalFileCount)
            NotificationCenter.default.post(name: .UnicodeDataFilesLoadingProgressDidChange, object: progress)
        }
    }
    
    override func main() {
        
        collectFileGarbage()
        
        if Keyboard.default.cacheVersion != Bundle.main.cacheVersion {
            UnicodeData.default.resetPersistentStore()
        }
        
        guard UnicodeData.default.itemCount == 0 else {
            NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
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
                parse(dataItem: dataItem) { (string) in
                    
                    let components = string.split(maxSplits: 2, omittingEmptySubsequences: false) { [columnSeparator, commentMarker].contains($0) } .map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    let unicodeScalars = components[0].components(separatedBy: .whitespaces).map {$0.hexToUnicodeScalar!}
                    
                    if unicodeScalars.count == 1 {
                        emojiCharacterSet.insert(unicodeScalars.first!)
                    }
                    
                    let codePoints: String = unicodeScalars.map {$0.description} .reduce(.init(), +)
                    
                    switch components[1] {
                    case "component", "fully-qualified":
                        let name: String = components[2].drop {$0 != .space} .description.trimmingCharacters(in: .whitespaces)
                        
                        UnicodeData.default.addItem(codePoints: codePoints, name: name)
                        
                        fullyQualifiedEmoji = codePoints
                        
                    case "minimally-qualified", "unqualified":
                        AnnotationsXMLParser.toFullyQualifiedDictionary[codePoints] = fullyQualifiedEmoji
                        
                    default:
                        fatalError()
                    }
                }
                
            case .derivedName:
                parse(dataItem: dataItem) { (string) in
                    
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
                parse(dataItem: dataItem, using: AnnotationsXMLParser.self)
            }
        }
        
        AnnotationsXMLParser.toFullyQualifiedDictionary = .init()
        
        try! UnicodeData.default.backgroundContext.save()
        
        Keyboard.default.cacheVersion = Bundle.main.cacheVersion
        
        NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
    }
    
    private func parse(dataItem: UnicodeDataItem, parse: (String) -> Void) {
        for string in dataItem.strings {
            
            if string.isEmpty == false && string.hasPrefix(commentMarker.description) == false {
                autoreleasepool {
                    parse(string)
                }
            }
        }
        
        processedFileCount += 1
    }
    
    private func parse(dataItem: UnicodeDataItem, using xmlParser: XMLParser.Type) {
        dataItem.fileURLs.forEach { (fileURL) in
            autoreleasepool {
                xmlParser.init(contentsOf: fileURL)?.parse()
                try! UnicodeData.default.backgroundContext.save()
                processedFileCount += 1
            }
        }
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
    
    static let UnicodeDataFilesDidLoad: NSNotification.Name = .init("KEKbzAcMuOVK4Tn46LFP3loanqNMAB9")
}

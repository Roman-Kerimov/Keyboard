//
//  LoadUnicodeDataFiles.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation
import CryptoKit

class LoadUnicodeDataFiles: Operation {
    let columnSeparator: Character = ";"
    let commentMarker: Character = "#"
    
    static var ordersByCodePoints: [String: Int] = [:]
    
    private lazy var sqLiteSourceURL = UnicodeData.default.persistentStoreDescriptions.first!.url!
    private lazy var sqLiteTargetURL = URL(fileURLWithPath: CommandLine.arguments[1]).appendingPathComponent(UnicodeData.default.name).appendingPathExtension(sqLiteSourceURL.pathExtension)
    
    override func main() {
        
        if loadedVersion != currentVersion || !FileManager.default.fileExists(atPath: sqLiteTargetURL.path) {
            UnicodeData.default.resetPersistentStore()
        }
        
        guard UnicodeData.default.itemCount == 0 else {
            return
        }
        
        var emojiCharacterSet: CharacterSet = .init()
        var fullyQualifiedEmoji: String = ""
        var totalStrokes: [String: Int] = [:]
        var frequencies: [String: Int] = [:]
        
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
                    
                    switch EmojiStatus(rawValue: components[1])! {
                    case .component, .fullyQualified:
                        let name: String = components[2].components(separatedBy: String.space).dropFirst(2).joined(separator: .space).description.trimmingCharacters(in: .whitespaces)
                        
                        UnicodeData.default.addItem(codePoints: codePoints, name: name)
                        LoadUnicodeDataFiles.ordersByCodePoints[codePoints] = UnicodeData.default.itemCount
                        
                        fullyQualifiedEmoji = codePoints
                        
                    case .minimallyQualified, .unqualified:
                        AnnotationsXMLParser.toFullyQualifiedDictionary[codePoints] = fullyQualifiedEmoji
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
                
            case .nameAliases:
                
                let language = "en"
                
                var wordSet: Set<String> = []
                
                var aliases: [String] = []
                
                var unicodeItem: UnicodeItem? = nil {
                    willSet {
                        if unicodeItem != newValue {
                            unicodeItem?.set(language: language)
                            
                            aliases.sort {
                                if $0.first == $1.first {
                                    return $0.count < $1.count
                                }
                                else {
                                    return $0.first! < $1.first!
                                }
                            }
                            
                            let annotation = aliases.joined(separator: UnicodeItem.nameSeparator)
                            unicodeItem?.set(annotation: annotation)
                            wordSet.formUnion(annotation.words)
                            
                            aliases = [newValue!.name!]
                        }
                    }
                }
                
                dataItem.parse { (string) in
                    let fields = string.components(separatedBy: columnSeparator.description)
                    
                    let codePoint = fields[0].hexToUnicodeScalar!.description
                    let alias = fields[1]
                    let type = NameAliasType(rawValue: fields[2])!
                    
                    guard let item = UnicodeData.default.item(codePoints: codePoint, language: "") else {
                        return
                    }
                    
                    unicodeItem = item
                    
                    switch type {
                    case .correction:
                        aliases = [alias]
                        
                    case .alternate, .abbreviation:
                        aliases.append(alias)
                        
                    case .control, .figment:
                        break
                    }
                }
                
                wordSet.subtract(UnicodeData.default.words(language: language))
                
                wordSet.forEach { (word) in
                    UnicodeData.default.addWord(word, language: language)
                }
                
            case .unihanDictionaryLikeData, .unihanReadings:
                
                var wordSets: [String: Set<String>] = [:]

                var language: String = "" {
                    didSet {
                        if wordSets[language] == nil {
                            wordSets[language] = []
                        }
                    }
                }

                dataItem.parse { (string) in
                    let components = string.components(separatedBy: "\t")

                    let codePoint = components[0].components(separatedBy: "+").last!.hexToUnicodeScalar!.description
                    let fieldType = UnihanFieldType(rawValue: components[1])!
                    let value = components[2]

                    switch fieldType {
                    
                    // DictionaryLikeData
                    
                    case .frequency:
                        frequencies[codePoint] = Int(value)!
                        
                    case .totalStrokes:
                        totalStrokes[codePoint] = Int(value.words.first!)!

                    // Readings

                    case .mandarin:
                        language = "zh"
                        wordSets[language]!.formUnion(value.words)
                        UnicodeData.default.addItem(codePoints: codePoint, language: language, annotation: value, totalStrokes: totalStrokes[codePoint]!, frequency: frequencies[codePoint])

                    default:
                        return
                    }
                }

                wordSets.forEach { (language, wordSet) in
                    wordSet.subtracting(UnicodeData.default.words(language: language)).forEach { (word) in
                        UnicodeData.default.addWord(word, language: language)
                    }
                }
                
            case .annotations, .annotationsDerived, .main, .subdivisions:
                AnnotationsXMLParser.unicodeDataItem = dataItem
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
        func hash(url: URL) -> String {
            autoreleasepool {
                if let urls = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) {
                    return urls.sorted {$0.path < $1.path} .map {hash(url: $0)} .joined()
                }
                else if let data = try? Data(contentsOf: url) {
                    return SHA256.hash(data: data).description
                }
                else {
                    return ""
                }
            }
        }
        
        let dependencies = UnicodeDataItem.allCases.map {$0.rawValue} + [
            Bundle.main.executableURL!.lastPathComponent,
            UnicodeData.default.name,
            sqLiteTargetURL.path,
        ]
        
        return dependencies.map {hash(url: URL(fileURLWithPath: $0))} .joined()
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

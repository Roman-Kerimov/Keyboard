//
//  UnicodeDataItem.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2018-05-27.
//

import Foundation

enum UnicodeDataItem: String, CaseIterable {
    case emojiTest = "Emoji/emoji-test.txt"
    case derivedName = "UCD/extracted/DerivedName.txt"
    case nameAliases = "UCD/NameAliases.txt"
    case unihanDictionaryLikeData = "Unihan/Unihan_DictionaryLikeData.txt"
    case unihanReadings = "Unihan/Unihan_Readings.txt"
    case main = "CLDR/common/main"
    case annotations = "CLDR/common/annotations"
    case annotationsDerived = "CLDR/common/annotationsDerived"
    case subdivisions = "CLDR/common/subdivisions"
    case keyboards = "CLDR/keyboards"
    
    var path: String {
        return rawValue
    }
    
    var fileURLs: [URL] {
        let itemURL = URL(fileURLWithPath: path)
        
        return fileURLs(url: itemURL).sorted {$0.path < $1.path}
    }
    
    private func fileURLs(url: URL) -> [URL] {
        if let urls = try? FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: []) {
            return urls.flatMap {fileURLs(url: $0)}
        }
        else {
            return [url]
        }
    }
    
    var strings: [String] {
        return fileURLs.flatMap { (fileURL) -> [String] in
            return (try! String.init(contentsOf: fileURL)).split(separator: .return).map {String.init($0)}
        }
    }
    
    static let totalFileCount = allCases.map {$0.fileURLs.count}.reduce(0, +)
    
    func parse(parse: (String) -> Void) {
        for string in strings {
            
            if string.isEmpty == false && string.hasPrefix("#".description) == false {
                autoreleasepool {
                    parse(string)
                }
            }
        }
        
        processedFileCount += 1
    }
    
    func parse(using xmlParser: XMLParser.Type) {
        fileURLs.forEach { (fileURL) in
            autoreleasepool {
                xmlParser.init(contentsOf: fileURL)?.parse()
                try! UnicodeData.default.backgroundContext.save()
                processedFileCount += 1
            }
        }
    }
}

fileprivate var processedFileCount: Int = 0 {
    didSet {
        let progress: Float = (.init(processedFileCount) / .init(UnicodeDataItem.totalFileCount) * 100).rounded(.down)
        print("\(processedFileCount)/\(UnicodeDataItem.totalFileCount)\t\(Int(progress)) %")
    }
}

extension Character {
    static let `return`: Self = "\n"
}

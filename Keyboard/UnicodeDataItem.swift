//
//  UnicodeDataItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-27.
//

import Foundation

enum UnicodeDataItem: String, CaseIterable {
    case emojiTest = "emoji-test.txt"
    case derivedName = "DerivedName.txt"
    case annotations
    case annotationsDerived
    
    var name: String {
        return rawValue
    }
    
    var fileURLs: [URL] {
        guard let itemURL = Bundle.main.url(forResource: name, withExtension: nil) else {
            fatalError("Unicode data item '\(name)' is not found")
        }
        
        if let urls = try? FileManager.default.contentsOfDirectory(at: itemURL, includingPropertiesForKeys: nil, options: []) {
            return urls
        }
        else {
            return [itemURL]
        }
    }
    
    var strings: [String] {
        return fileURLs.flatMap { (fileURL) -> [String] in
            return (try! String.init(contentsOf: fileURL)).split(separator: .return).map {String.init($0)}
        }
    }
    
    static let totalFileCount = allCases.map {$0.fileURLs.count}.reduce(0, +)
}

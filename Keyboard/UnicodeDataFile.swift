//
//  UnicodeDataFile.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-27.
//

import Foundation

enum UnicodeDataFile: String, CaseIterable {
    case derivedName = "DerivedName"
    case emojiTest = "emoji-test"
    
    var name: String {
        return rawValue
    }
    
    var fileURL: URL {
        return Bundle.main.url(forResource: name, withExtension: "txt")!
    }
    
    var strings: [String] {
        return (try! String.init(contentsOf: fileURL)).split(separator: .return).map {String.init($0)}
    }
    
    var cacheURL: URL {
        return UnicodeTable.default.cacheURL.appendingPathComponent(name)
    }
    
    static let totalStringCount = allCases.map {$0.strings.count}.reduce(0, +)
}

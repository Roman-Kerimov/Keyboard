//
//  UnicodeDataFile.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-27.
//

import Foundation

enum UnicodeDataFile: String, EnumCases {
    case derivedName = "DerivedName"
    
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
        return URL.applicationSupport.appendingPathComponent(name)
    }
    
    static let totalStringCount = cases.map {$0.strings.count}.reduce(0, +)
}

//
//  String.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2019-12-30.
//

import Foundation

extension String {
    var words: [String] {
        return components(separatedBy: .whitespaces).map {$0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)}.filter {!$0.isEmpty}
    }
}

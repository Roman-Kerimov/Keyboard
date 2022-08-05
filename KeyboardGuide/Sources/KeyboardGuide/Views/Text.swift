//
//  Text.swift
//  
//
//  Created by Roman Kerimov on 2020-09-25.
//

import SwiftUI

extension Text {
    static func markdown(_ markdown: String) -> Text {
        markdown.components(separatedBy: "**")
            .map {
                Text($0)
            }
            .enumerated()
            .map {
                !$0.offset.isMultiple(of: 2) ? $0.element.bold() : $0.element
            }
            .reduce(Text(""), +)
    }
}

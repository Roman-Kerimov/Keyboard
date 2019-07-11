//
//  DocumentContext.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-30.
//

import Foundation

struct DocumentContext: Equatable {
    let beforeInput: String?
    let afterInput: String?
    
    static func ==(left: DocumentContext, right: DocumentContext) -> Bool {
        return left.beforeInput == right.beforeInput && left.afterInput == right.afterInput
    }
    
    init(beforeInput: String? = nil, afterInput: String? = nil) {
        self.beforeInput = beforeInput
        self.afterInput = afterInput
    }
}

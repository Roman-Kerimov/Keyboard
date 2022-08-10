//
//  DocumentContext.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-30.
//

import Foundation

public struct DocumentContext: Equatable {
    public let beforeInput: String?
    public let afterInput: String?
    
    public static func ==(left: DocumentContext, right: DocumentContext) -> Bool {
        left.beforeInput == right.beforeInput && left.afterInput == right.afterInput
    }
    
    public init(beforeInput: String? = nil, afterInput: String? = nil) {
        self.beforeInput = beforeInput
        self.afterInput = afterInput
    }
    
    public static let empty = DocumentContext()
}

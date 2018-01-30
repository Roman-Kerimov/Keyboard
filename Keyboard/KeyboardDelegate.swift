//
//  KeyboardDelegate.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-29.
//

import Foundation

protocol KeyboardDelegate {
    func delete()
    func space()
    func spaceInsist()
    func `return`()
    func tab()
    func settings()
    func insert(text: String)
    
    var documentContext: DocumentContext {get}
}

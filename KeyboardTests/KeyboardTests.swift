//
//  KeyboardTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-07-06.
//

import XCTest
@testable import Keyboard

class KeyboardTests: XCTestCase, KeyboardDelegate {
    func delete() {
        guard document.count > 0 else {
            return
        }
        
        document.removeLast()
    }
    
    func enter() {}
    
    func settings() {}
    
    func insert(text: String) {
        document.append(text)
    }
    
    var documentContext: DocumentContext {
        return .init(beforeInput: document, afterInput: .init())
    }
    
    var document: String = .init()

    override func setUp() {
        Keyboard.default.delegate = self
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExtraArrayExtension() {
        let t: Key = Key.init(label: "t")
        Keyboard.default.down(key: t)
        Keyboard.default.up(key: t)
        
        let h: Key = Key.init(label: "h")
        Keyboard.default.down(key: h)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: h)
        
        let a: Key = Key.init(label: "a")
        Keyboard.default.down(key: a)
        Keyboard.default.shift(direction: .right)
        XCTAssertEqual(document, "þə")
        Keyboard.default.up(key: a)
    }

}

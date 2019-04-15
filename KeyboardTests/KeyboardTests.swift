//
//  KeyboardTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-07-06.
//

import XCTest
@testable import Keyboard

import LinguisticKit

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

    func testScriptTranslation() {
        let cyrillicText = "Съешь же ещё этих мягких французских булок, да выпей чаю."
        let latinText = cyrillicText.translating(from: .Cyrl, to: .Latn, withTable: .ru)
        
        insert(text: latinText)
        insert(text: .return)
        insert(text: latinText)
        insert(text: " ru")
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
        
        Keyboard.default.autocomplete()
        
        XCTAssertEqual(documentContext.beforeInput, [latinText, cyrillicText].joined(separator: .return))
    }
    
    func testByDefaultShiftGestures() {
        for character in characterComponentsDictionary.keys {
            
            guard let shiftGesture = character.defaultShiftGesture else {
                continue
            }
            
            document = .init()
            
            func upKeyIfNeeded() {
                if let key = Keyboard.default.currentKey {
                    Keyboard.default.up(key: key)
                }
            }
            
            for gestureComponent in shiftGesture {
                guard let shiftDirection = Keyboard.ShiftDirection.init(rawValue: gestureComponent) else {
                    upKeyIfNeeded()
                    
                    Keyboard.default.down(key: Key.init(label: gestureComponent.description))
                    
                    continue
                }
                
                Keyboard.default.shift(direction: shiftDirection)
            }
            
            upKeyIfNeeded()
            
            XCTAssertEqual(document, character)
        }
    }
}

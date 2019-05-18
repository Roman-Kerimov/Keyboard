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
    
    func testModifierLetters() {
        let a: Key = Key.init(label: "a")
        Keyboard.default.down(key: a)
        Keyboard.default.up(key: a)
        
        let u: Key = Key.init(label: "u")
        Keyboard.default.down(key: u)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "ă")
        
        Keyboard.default.shift(direction: .upRight)
        XCTAssertEqual(document, "a˘")
        
        Keyboard.default.up(key: u)
        
        let o: Key = Key.init(label: "o")
        Keyboard.default.down(key: o)
        
        Keyboard.default.shift(direction: .downLeft)
        XCTAssertEqual(document, "a˘̥")
        
        Keyboard.default.shift(direction: .downRight)
        XCTAssertEqual(document, "a˘˳")
        
        Keyboard.default.up(key: o)
    }
    
    func testCombiningCharactersAtBeginningOfString() {
        let a: Key = Key.init(label: "a")
        Keyboard.default.down(key: a)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "́")
        
        Keyboard.default.up(key: a)

    }
    
    func testCompoundCombiningCharacters() {
        let a: Key = Key.init(label: "a")
        Keyboard.default.down(key: a)
        Keyboard.default.up(key: a)
        
        
        Keyboard.default.down(key: a)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "á")
        
        Keyboard.default.up(key: a)
        
        let hyphen = Key.init(label: "‐")
        Keyboard.default.down(key: hyphen)
        
        Keyboard.default.shift(direction: .left)
        XCTAssertEqual(document, "a᷇")
        
        Keyboard.default.up(key: hyphen)
    }
    
    func testExtraLigatures() {
        let n: Key = Key.init(label: "n")
        Keyboard.default.down(key: n)
        Keyboard.default.up(key: n)
        
        let j: Key = Key.init(label: "j")
        Keyboard.default.down(key: j)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.shift(direction: .right)
        Keyboard.default.up(key: j)
        
        XCTAssertEqual(document, "ǌ")
    }
    
    func testCharactersWithRingComponent() {
        let x: Key = Key.init(label: "x")
        Keyboard.default.down(key: x)
        Keyboard.default.up(key: x)
        
        let h: Key = Key.init(label: "h")
        Keyboard.default.down(key: h)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: h)
        
        let o: Key = Key.init(label: "o")
        Keyboard.default.down(key: o)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: o)
        
        XCTAssertEqual(document, "ꭔ")
    }
    
    func testCapitalExtraCharacters() {
        let m: Key = Key.init(label: "m")
        Keyboard.default.down(key: m)
        
        Keyboard.default.shift(direction: .up)
        Keyboard.default.shift(direction: .right)
        Keyboard.default.shift(direction: .down)
        
        Keyboard.default.up(key: m)
        
        XCTAssertEqual(document, "ꟽ")
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

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
    
    #if canImport(UIKit)
    var returnKeyType: UIReturnKeyType? {nil}
    #endif
    
    var document: String = .init()

    override func setUp() {
        Keyboard.default.delegate = self
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExtraArrayExtension() {
        let t: Key = .by(labelCharacter: "t")!
        Keyboard.default.down(key: t)
        Keyboard.default.up(key: t)
        
        let h: Key = .by(labelCharacter: "h")!
        Keyboard.default.down(key: h)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: h)
        
        let a: Key = .by(labelCharacter:"a")!
        Keyboard.default.down(key: a)
        Keyboard.default.shift(direction: .right)
        XCTAssertEqual(document, "þə")
        Keyboard.default.up(key: a)
    }
    
    func testModifierLetters() {
        let a: Key = .by(labelCharacter:"a")!
        Keyboard.default.down(key: a)
        Keyboard.default.up(key: a)
        
        let u: Key = .by(labelCharacter:"u")!
        Keyboard.default.down(key: u)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "ă")
        
        Keyboard.default.shift(direction: .upRight)
        XCTAssertEqual(document, "a˘")
        
        Keyboard.default.up(key: u)
        
        let o: Key = .by(labelCharacter:"o")!
        Keyboard.default.down(key: o)
        
        Keyboard.default.shift(direction: .downLeft)
        XCTAssertEqual(document, "a˘̥")
        
        Keyboard.default.shift(direction: .downRight)
        XCTAssertEqual(document, "a˘˳")
        
        Keyboard.default.up(key: o)
    }
    
    func testCombiningCharactersAtBeginningOfString() {
        let a: Key = .by(labelCharacter:"a")!
        Keyboard.default.down(key: a)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "́")
        
        Keyboard.default.up(key: a)

    }
    
    func testCompoundCombiningCharacters() {
        let a: Key = .by(labelCharacter:"a")!
        Keyboard.default.down(key: a)
        Keyboard.default.up(key: a)
        
        
        Keyboard.default.down(key: a)
        
        Keyboard.default.shift(direction: .upLeft)
        XCTAssertEqual(document, "á")
        
        Keyboard.default.up(key: a)
        
        let hyphen: Key = .by(labelCharacter:"‐")!
        Keyboard.default.down(key: hyphen)
        
        Keyboard.default.shift(direction: .left)
        XCTAssertEqual(document, "a᷇")
        
        Keyboard.default.up(key: hyphen)
    }
    
    func testExtraLigatures() {
        let n: Key = .by(labelCharacter:"n")!
        Keyboard.default.down(key: n)
        Keyboard.default.up(key: n)
        
        let j: Key = .by(labelCharacter:"j")!
        Keyboard.default.down(key: j)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.shift(direction: .right)
        Keyboard.default.up(key: j)
        
        XCTAssertEqual(document, "ǌ")
    }
    
    func testĿL() {
        let l: Key = .by(labelCharacter:"l")!
        Keyboard.default.down(key: l)
        Keyboard.default.shift(direction: .up)
        Keyboard.default.up(key: l)
        
        Keyboard.default.down(key: l)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.shift(direction: .up)
        Keyboard.default.up(key: l)
        
        XCTAssertEqual(document, "ĿL")
    }
    
    func testCharactersWithRingComponent() {
        let x: Key = .by(labelCharacter:"x")!
        Keyboard.default.down(key: x)
        Keyboard.default.up(key: x)
        
        let h: Key = .by(labelCharacter:"h")!
        Keyboard.default.down(key: h)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: h)
        
        let o: Key = .by(labelCharacter:"o")!
        Keyboard.default.down(key: o)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: o)
        
        XCTAssertEqual(document, "ꭔ")
    }
    
    func testCapitalExtraCharacters() {
        let m: Key = .by(labelCharacter:"m")!
        Keyboard.default.down(key: m)
        
        Keyboard.default.shift(direction: .up)
        Keyboard.default.shift(direction: .right)
        Keyboard.default.shift(direction: .down)
        
        Keyboard.default.up(key: m)
        
        XCTAssertEqual(document, "ꟽ")
    }
    
    func testEquivalentTo() {
        let equal: Key = .by(shiftDownLabelCharacter:"=")!
        Keyboard.default.down(key: equal)
        Keyboard.default.shift(direction: .down)
        Keyboard.default.up(key: equal)
        
        let u: Key = .by(labelCharacter:"u")!
        Keyboard.default.down(key: u)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: u)
        
        XCTAssertEqual(document, "≍")
    }
    
    func testOhmSign() {
        let o: Key = .by(labelCharacter: "o")!
        Keyboard.default.down(key: o)
        Keyboard.default.shift(direction: .up)
        Keyboard.default.up(key: o)
        
        let m: Key = .by(labelCharacter: "m")!
        Keyboard.default.down(key: m)
        Keyboard.default.shift(direction: .left)
        Keyboard.default.up(key: m)
        
        XCTAssertEqual(document.unicodeScalars.first?.value, 0x2126)
    }

    func testScriptTransformation() {
        let cyrillicText = "Съешь же ещё этих мягких французских булок, да выпей чаю."
        let latinText = cyrillicText.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)
        
        insert(text: latinText)
        insert(text: .return)
        insert(text: latinText)
        insert(text: " ru")
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
        
        Keyboard.default.characterSequence.autocomplete()
        
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
                    
                    guard gestureComponent.characterComponents != [.quotationMark] else {
                        Keyboard.default.down(key: .by(shiftDownLabelCharacter: "'")!)
                        Keyboard.default.shift(direction: .down)
                        Keyboard.default.shift(direction: .up)
                        
                        continue
                    }
                    
                    if let key: Key = .by(labelCharacter: gestureComponent) {
                        Keyboard.default.down(key: key)
                    }
                    else if let key: Key = .by(shiftUpLabelCharacter: gestureComponent) {
                        Keyboard.default.down(key: key)
                        Keyboard.default.shift(direction: .up)
                    }
                    else if let key: Key = .by(shiftDownLabelCharacter: gestureComponent) {
                        Keyboard.default.down(key: key)
                        Keyboard.default.shift(direction: .down)
                    }
                    
                    continue
                }
                
                Keyboard.default.shift(direction: shiftDirection)
            }
            
            upKeyIfNeeded()
            
            XCTAssertEqual(document, character)
        }
    }
}

//
//  Array<CharacterComponent>Tests.swift
//  KeyboardTests
//
//  Created by Roman Kerimov on 2017-10-18.
//

import XCTest
@testable import KeyboardModule

class Array_CharacterComponent_Tests: XCTestCase {
    
    var characterComponets: [CharacterComponent] = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        characterComponets = []
        
        super.tearDown()
    }
    
    func testEmptyComponents() {
        XCTAssert(characterComponets.character.isEmpty)
    }
    
    func testLowercaseAndUppercase() {
        characterComponets.append(.a)
        XCTAssert(characterComponets.character == "a")
        
        characterComponets.append(.capital)
        XCTAssert(characterComponets.character == "A")
    }
    
    func testCompoundCombiningCharacters() {
        characterComponets.append(.acute)
        characterComponets.append(.above)
        XCTAssert(characterComponets.character == "́")
        
        characterComponets.append(.macron)
        XCTAssert(characterComponets.character == "᷇")
    }

    func testNormalizationOfCommutativeCharacterComponents() {
        XCTAssertEqual([.r, .capital, .smallCapital].normalized, [.r, .smallCapital, .capital].normalized)
        XCTAssertEqual([.p, .extraH, .greek].normalized, [.p, .greek, .extraH].normalized)
        XCTAssertEqual([.acute, .above, .macron].normalized, [.acute, .macron, .above].normalized)
    }
    
    func testExtraArray() {
        characterComponets = [.r, .smallCapital]
        XCTAssertEqual((characterComponets + [.turned]).normalized, characterComponets.extraArray[0])
        XCTAssertEqual((characterComponets + [.reversed]).normalized, characterComponets.extraArray[1])
        XCTAssertEqual((characterComponets + [.inverted]).normalized, characterComponets.extraArray[2])
    }
    
    func testHumanReadabilityKeys() {
        XCTAssert([.a, .capital].key == ".a, .capital")
    }
    
    func testDebugDestcription() {
        XCTAssertEqual([CharacterComponent.a, .capital].debugDescription, "[.a, .capital]")
    }
    
    func testDefaultShiftGesture() {
        XCTAssertEqual("A".characterComponents.defaultShiftGesture, "a↑")
        XCTAssertEqual("ʟ".characterComponents.defaultShiftGesture, "l↑↓")
        XCTAssertEqual("Ʀ".characterComponents.defaultShiftGesture, "r↑↓↑")
        XCTAssertEqual("ᵃ".characterComponents.defaultShiftGesture, "a↗︎")
        XCTAssertEqual("ᴬ".characterComponents.defaultShiftGesture, "a↑↗︎")
        XCTAssertEqual("ə".characterComponents.defaultShiftGesture, "a→")
        XCTAssertEqual("¡".characterComponents.defaultShiftGesture, "!→")
        XCTAssertEqual("ɐ".characterComponents.defaultShiftGesture, "a→↓")
        XCTAssertEqual("ʁ".characterComponents.defaultShiftGesture, "r↑↓→↓←")
        XCTAssertEqual("ᵊ".characterComponents.defaultShiftGesture, "a→↗︎")
        XCTAssertEqual("ᵄ".characterComponents.defaultShiftGesture, "a→↓↗︎")
        XCTAssertEqual("ₐ".characterComponents.defaultShiftGesture, "a↘︎")
        XCTAssertEqual("æ".characterComponents.defaultShiftGesture, "ae←")
        XCTAssertEqual("ǈ".characterComponents.defaultShiftGesture, "l↑j←")
        XCTAssertEqual("Ǉ".characterComponents.defaultShiftGesture, "l↑j↑←")
        XCTAssertEqual("℃".characterComponents.defaultShiftGesture, "@→c↑←")
        XCTAssertEqual("ꟹ".characterComponents.defaultShiftGesture, "oe←↗︎")
        XCTAssertEqual("ʂ".characterComponents.defaultShiftGesture, "st←")
        XCTAssertEqual("ﬆ".characterComponents.defaultShiftGesture, "st←→")
        XCTAssertEqual("̢".characterComponents.defaultShiftGesture, "t↙︎")

        XCTAssertEqual("̗".characterComponents.defaultShiftGesture, "a↙︎")
        XCTAssertEqual("́".characterComponents.defaultShiftGesture, "a↖︎")
        
        XCTAssertEqual("⃒".characterComponents.defaultShiftGesture, "|←")
        
        XCTAssertEqual("“".characterComponents.defaultShiftGesture, "\"↖︎")
        XCTAssertEqual("«".characterComponents.defaultShiftGesture, "\"←")
        XCTAssertEqual("„".characterComponents.defaultShiftGesture, "\"↙︎")
        XCTAssertEqual("”".characterComponents.defaultShiftGesture, "\"↗︎")
        XCTAssertEqual("»".characterComponents.defaultShiftGesture, "\"→")
        XCTAssertEqual("᷄".characterComponents.defaultShiftGesture, "‐↖︎a←")
        XCTAssertEqual("‛".characterComponents.defaultShiftGesture, "\'↗︎→")
        XCTAssertEqual("£".characterComponents.defaultShiftGesture, nil)
        
    }
    
    func testDefaultShiftGestureForModifierLetters() {
        XCTAssertEqual("˘".characterComponents.defaultShiftGesture, "u↖︎↗︎")
        XCTAssertEqual("˳".characterComponents.defaultShiftGesture, "o↙︎↘︎")
    }
    
    func testDefaultShiftGestureForCyrillicLetters() {
        XCTAssertEqual("Я".characterComponents.defaultShiftGesture, nil)
    }
    
    func testDefaultShiftGestureForĿL() {
        XCTAssertEqual("Ŀl".characterComponents.defaultShiftGesture, "l↑l←")
        XCTAssertEqual("ĿL".characterComponents.defaultShiftGesture, "l↑l↑←")
    }
    
    func testExtraDownShiftGesture() {
        XCTAssertEqual("§".characterComponents.defaultShiftGesture, "ss←↓")
    }
}
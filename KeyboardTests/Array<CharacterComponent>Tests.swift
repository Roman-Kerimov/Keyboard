//
//  Array<CharacterComponent>Tests.swift
//  KeyboardTests
//
//  Created by Roman Kerimov on 2017-10-18.
//

import XCTest
@testable import Keyboard

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

    func testNormalizationOfCommutativeCharacterComponents() {
        XCTAssertEqual([.r, .capital, .smallCapital].normalized, [.r, .smallCapital, .capital].normalized)
        XCTAssertEqual([.p, .extraH, .greek].normalized, [.p, .greek, .extraH].normalized)
    }
    
    func testExtraArrow() {
        characterComponets = [.r, .smallCapital]
        XCTAssertEqual((characterComponets + [.turned]).normalized, characterComponets.extraArray[0])
        XCTAssertEqual((characterComponets + [.reversed]).normalized, characterComponets.extraArray[1])
        XCTAssertEqual((characterComponets + [.inverted]).normalized, characterComponets.extraArray[2])
    }
    
    func testHumanReadabilityKeys() {
        XCTAssert([.a, .capital].key == ".a, .capital")
    }
    
    func testShiftGestures() {
        XCTAssertEqual("A".characterComponents.shiftGestures, ["a↑"])
        XCTAssertEqual("ʟ".characterComponents.shiftGestures, ["l↑↓"])
        XCTAssertEqual("Ʀ".characterComponents.shiftGestures, ["r↑↓↑"])
        XCTAssertEqual("ᵃ".characterComponents.shiftGestures, ["a↗︎"])
        XCTAssertEqual("ᴬ".characterComponents.shiftGestures, ["a↑↗︎", "a↗︎↑"])
        XCTAssertEqual("ə".characterComponents.shiftGestures, ["a→"])
        XCTAssertEqual("¡".characterComponents.shiftGestures, ["!→"])
        XCTAssertEqual("ɐ".characterComponents.shiftGestures, ["a→↓"])
        XCTAssertEqual("ʁ".characterComponents.shiftGestures, ["r↑↓→↓←"])
        XCTAssertEqual("ᵊ".characterComponents.shiftGestures, ["a→↗︎", "a↗︎→"])
        XCTAssertEqual("ᵄ".characterComponents.shiftGestures, ["a→↓↗︎", "a↗︎→↓"])
        XCTAssertEqual("ₐ".characterComponents.shiftGestures, ["a↘︎"])
        XCTAssertEqual("æ".characterComponents.shiftGestures, ["ae←"])
        XCTAssertEqual("ǈ".characterComponents.shiftGestures, ["l↑j←", "lj↑←", "lj←↑"])
        XCTAssertEqual("Ǉ".characterComponents.shiftGestures, ["l↑j↑←", "l↑j←↑", "lj↑←↑"])
        XCTAssertEqual("ꟹ".characterComponents.shiftGestures, ["o↗︎e←", "oe↗︎←", "oe←↗︎"])
        XCTAssertEqual("ʂ".characterComponents.shiftGestures, ["st←"])
        XCTAssertEqual("̢".characterComponents.shiftGestures, ["t↙︎"])

        XCTAssertEqual("̗".characterComponents.shiftGestures, ["a↙︎"])
        XCTAssertEqual("́".characterComponents.shiftGestures, ["a↖︎"])
        
        XCTAssertEqual("⃒".characterComponents.shiftGestures, ["|←"])
        
        XCTAssertEqual("“".characterComponents.shiftGestures, ["\"↖︎"])
        XCTAssertEqual("«".characterComponents.shiftGestures, ["\"←"])
        XCTAssertEqual("„".characterComponents.shiftGestures, ["\"↙︎"])
        XCTAssertEqual("”".characterComponents.shiftGestures, ["\"↗︎"])
        XCTAssertEqual("»".characterComponents.shiftGestures, ["\"→"])
    }
}

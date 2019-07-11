//
//  Array<CharacterComponent>Tests.swift
//  iOSKeyboardTests
//
//  Created by Roman Kerimov on 2017-10-18.
//

import XCTest
@testable import iOSKeyboard

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
    }
    
    func testExtraArrow() {
        characterComponets = [.r, .smallCapital]
        XCTAssertEqual((characterComponets + [.turned]).normalized, characterComponets.extraArray[0])
        XCTAssertEqual((characterComponets + [.reversed]).normalized, characterComponets.extraArray[1])
        XCTAssertEqual((characterComponets + [.inverted]).normalized, characterComponets.extraArray[2])
    }
}

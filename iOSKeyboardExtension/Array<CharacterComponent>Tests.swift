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

    
}

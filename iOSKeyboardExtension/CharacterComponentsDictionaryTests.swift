//
//  CharacterComponentsDictionaryTests.swift
//  iOSKeyboardTests
//
//  Created by Roman Kerimov on 2017-09-25.
//

import XCTest
@testable import iOSKeyboard

class CharacterComponentsDictionaryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDictionaryDoesNotContainDuplicateKeys() {
        XCTAssertNotNil(characterComponentsDictionary)
    }
}

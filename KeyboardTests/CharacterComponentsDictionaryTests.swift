//
//  CharacterComponentsDictionaryTests.swift
//  KeyboardTests
//
//  Created by Roman Kerimov on 2017-09-25.
//

import XCTest
@testable import Keyboard

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
    
    func testDictionaryDoesNotContainDuplicateValues() {
        var dictionary: [String: Int] = .init()
        for character in characterComponentsDictionary.keys {
            guard !character.characterComponents.isEmpty, character.characterComponents != [.combined] else {
                continue
            }
            XCTAssertNil(dictionary[character.characterComponents.key], "Dictionary literal contains duplicate value for \"\(character)\"")
            
            dictionary[character.characterComponents.key] = 1
        }
    }
    
    func testExtraArrayMaxCount() {
        let maxExtraCount = 3
        
        for character in characterComponentsDictionary.keys {
            XCTAssert(character.characterComponents.extraArray.count <= maxExtraCount, "Character \(character) has more than \(maxExtraCount) extra characters")
        }
    }
}

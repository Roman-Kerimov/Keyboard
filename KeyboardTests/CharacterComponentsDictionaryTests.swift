//
//  CharacterComponentsDictionaryTests.swift
//  KeyboardTests
//
//  Created by Roman Kerimov on 2017-09-25.
//

import XCTest

#if os(iOS)
@testable import iOSKeyboard
#elseif os(macOS)
@testable import macOSKeyboard
#endif

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
        for (character, characterComponents) in characterComponentsDictionary {
            guard !characterComponents.isEmpty else {
                continue
            }
            XCTAssertNil(dictionary[characterComponents.key], "Dictionary literal contains duplicate value for \"\(character)\"")
            
            dictionary[characterComponents.key] = 1
        }
    }
    
    func testExtraArrayMaxCount() {
        let maxExtraCount = 3
        
        for (character, characterComponents) in characterComponentsDictionary {
            XCTAssert(characterComponents.extraArray.count <= maxExtraCount, "Character \(character) has more than \(maxExtraCount) extra characters")
        }
    }
}
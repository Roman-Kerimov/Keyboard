//
//  KeyTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-02-23.
//

import XCTest
@testable import Keyboard

class KeyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShiftDownLabel() {
        XCTAssertEqual(Key.by(shiftDownLabelCharacter: "#")?.shiftDownLabel, "#№")
        XCTAssertEqual(Key.by(shiftDownLabelCharacter: "$")?.shiftDownLabel, "$₿")
    }

}

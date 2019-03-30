//
//  StringTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-03-28.
//

import XCTest
@testable import Keyboard

class StringTests: XCTestCase {

    func testShiftGesture() {
        XCTAssertEqual("ç̌".shiftGesture, "cs↙︎v↖︎")
        XCTAssertEqual("3²".shiftGesture, "32↗︎")
    }
}

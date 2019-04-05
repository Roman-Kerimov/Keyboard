//
//  StringTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-03-28.
//

import XCTest
@testable import Keyboard

class StringTests: XCTestCase {

    func testDefaultShiftGesture() {
        XCTAssertEqual("ç̌".defaultShiftGesture, "cs↙︎v↖︎")
        XCTAssertEqual("3²".defaultShiftGesture, "32↗︎")
    }
}

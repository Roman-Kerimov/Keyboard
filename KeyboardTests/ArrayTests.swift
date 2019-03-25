//
//  ArrayTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-03-24.
//

import XCTest
@testable import Keyboard

class ArrayTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPermulations() {
        XCTAssertEqual([1].permulations, [[1]])
        XCTAssertEqual([1,2].permulations, [[1,2], [2,1]])
        XCTAssertEqual([1,2,3].permulations, [[1,2,3], [2,1,3], [1,3,2], [2,3,1], [3,1,2], [3,2,1]])
        
        XCTAssertEqual([1,2,2].permulations, [[1,2,2], [2,1,2], [2,2,1]])
        
    }

}

//
//  UnicodeItemTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-11-26.
//

import XCTest
@testable import Keyboard

class UnicodeItemTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalizedName() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🇷🇺", language: "ru_Latn")?.localizedName, "RU | flag: Rossiya")
    }
    
    func testRegionCode() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🇬🇧", language: "ru_Latn")?.regionCode, "GB")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", language: "ru_Latn")?.regionCode, "GB‐ENG")
    }
}

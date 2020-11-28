//
//  UnicodeItemTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-11-26.
//

import XCTest
@testable import Keyboard
@testable import UnicodeData

class UnicodeItemTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalizedName() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🇷🇺", language: "ru_Latn")?.localizedName, "RU | flag: Rossiya")
        XCTAssertEqual(UnicodeData.default.flagItem(regionCode: "rukda", language: "ru_Cyrl")?.localizedName, "RU‐KDA | флаг: Краснодарский край")
        XCTAssertEqual(UnicodeData.default.flagItem(regionCode: "rukda", language: "ru_Latn")?.localizedName, "RU‐KDA | flag: Krasnodarskij kraj")
        XCTAssertEqual(UnicodeData.default.flagItem(regionCode: "usca", language: "en")?.localizedName, "US‐CA | flag: California")
    }
    
    func testRegionCode() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🇬🇧", language: "ru_Latn")?.regionCode, "GB")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", language: "ru_Latn")?.regionCode, "GB‐ENG")
    }
}

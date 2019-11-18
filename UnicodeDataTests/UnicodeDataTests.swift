//
//  UnicodeDataTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-11-15.
//

import XCTest
@testable import Keyboard

class UnicodeDataTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAnnotations() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🗨️", language: "en_CA")?.annotation, "dialogue | left speech bubble | speech")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🗨️", language: "en_CA")?.ttsAnnotation, "left speech bubble")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🗨️", language: "en")?.ttsAnnotation, "left speech bubble")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "🤨", language: "en_001")?.ttsAnnotation, "face with raised eyebrow")
    }

}

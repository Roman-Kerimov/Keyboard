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
    
    func testDefaultShiftGesturesForTilde() {
        
        // LATIN SMALL LETTER Z WITH MIDDLE TILDE
        XCTAssertEqual("ᵶ".defaultShiftGesture, "zn←")
        
        // COMBINING TILDE OVERLAY
        XCTAssertEqual("z̴".defaultShiftGesture, "z~←")
        
        
    }
    
    func testDefaultShiftGesturesForExtraCharacters() {
        XCTAssertEqual("ⱹ".defaultShiftGesture, "r→↓f←")
    }
    
    func testCandrabindu() {
        XCTAssertEqual("̐".defaultShiftGesture, "u↖︎.←")
    }
    
    func testDefaultShiftGesturesWithShiftRight() {
        XCTAssertEqual(">".defaultShiftGesture, "<→")
        XCTAssertEqual("≬".defaultShiftGesture, "((→←")
    }
    
    func testTypingDescription() {
        XCTAssertEqual("Я".typingDescription(languageCode: "ru"), "y↑a ru")
        XCTAssertEqual("ß".typingDescription(languageCode: "ru"), "ss←")
    }
    
    func testDefaultShiftGestureForCharactersWithSomeUnicodeScalars() {
        XCTAssertEqual("↖︎".defaultShiftGesture, "/→<←")
        XCTAssertEqual("ŀl".defaultShiftGesture, "ll←")
    }
    
    func testPreviewDescription() {
        XCTAssertEqual("̈".previewDescription, "◌̈")
    }
}

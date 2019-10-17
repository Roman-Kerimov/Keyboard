//
//  CharacterSearchTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-09-18.
//

import XCTest
@testable import Keyboard

class CharacterSearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func search(_ text: String) -> [String] {
        let characterSearch = CharacterSearch()
        
        characterSearch.search(text)
        characterSearch.searchOperationQueue.waitUntilAllOperationsAreFinished()
        
        return characterSearch.foundUnicodeItems.map {$0.codePoints}
    }
    
    func testSearch() {
        XCTAssert(search("deg").contains("°"))
    }
    
    func testSearchByAnnotations() {
        XCTAssert(search("bulka").contains("🍞"))
        XCTAssert(search("toddler").contains("🧒🏽"))
    }
    
    func testFlagSearchByRegionCode() {
        XCTAssertEqual(search("ru").first, "🇷🇺")
    }
    
    func testSubdivisionFlagSearchByRegionCode() {
        XCTAssertEqual(search("gbeng").first, "🏴󠁧󠁢󠁥󠁮󠁧󠁿")
        XCTAssertEqual(search("gbsct").first, "🏴󠁧󠁢󠁳󠁣󠁴󠁿")
        XCTAssertEqual(search("gbwls").first, "🏴󠁧󠁢󠁷󠁬󠁳󠁿")
    }
    
    func testCurrencySearchByRegionCode() {
        XCTAssertEqual(search("ru")[1], "₽")
    }
    
    func testSubdivisionCurrencySearchByRegionCode() {
        
        let gbCurrency = search("gb")[1]
        
        XCTAssertEqual(search("gbeng")[1], gbCurrency)
        XCTAssertEqual(search("gbsct")[1], gbCurrency)
        XCTAssertEqual(search("gbwls")[1], gbCurrency)
    }
    
    func testSearchWithScriptCode() {
        XCTAssertEqual(search("fki").first, "ф")
    }
    
    func testSearchByWordSuffix() {
        XCTAssert(search("apple").contains("🍍"))
    }
}

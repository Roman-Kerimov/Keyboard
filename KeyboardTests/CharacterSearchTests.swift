//
//  CharacterSearchTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-09-18.
//

import XCTest
@testable import KeyboardModule

class CharacterSearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func search(_ text: String) -> [String] {
        let characterSearch = CharacterSearch()
        
        characterSearch.search(textBeforeInput: text)
        characterSearch.searchOperationQueue.waitUntilAllOperationsAreFinished()
        
        return characterSearch.foundUnicodeItems.map {$0.codePoints}
    }
    
    func testSearch() {
        XCTAssert(search("deg").contains("°"))
        XCTAssert(search("o").contains("o"))
    }
    
    func testUnqualifiedSearch() {
        XCTAssertFalse(search("face").contains("☺"))
    }
    
    func testSearchByAnnotations() {
        XCTAssert(search("bulka").contains("🍞"))
        XCTAssert(search("toddler").contains("🧒🏽"))
        XCTAssert(search("Russland").contains("🇷🇺"))
        XCTAssert(search("Krasnodarskij").contains("🏴󠁲󠁵󠁫󠁤󠁡󠁿"))
        XCTAssert(search("California").contains("🏴󠁵󠁳󠁣󠁡󠁿"))
        XCTAssert(search("khleb").contains("🍞"))
        XCTAssert(search("tajmer").contains("⏲️"))
    }
    
    func testSearchByAliases() {
        XCTAssert(search("gha").contains("ƣ"))
        XCTAssert(search("zwj").contains("\u{200D}"))
    }
    
    func testComponentEmojiSearch() {
        XCTAssert(search("hair").contains("🦰"))
    }
    
    func testFlagSearchByRegionCode() {
        XCTAssertEqual(search("ru").first, "🇷🇺")
    }
    
    func testSubdivisionFlagSearchByRegionCode() {
        XCTAssertEqual(search("gbeng").first, "🏴󠁧󠁢󠁥󠁮󠁧󠁿")
        XCTAssertEqual(search("gbsct").first, "🏴󠁧󠁢󠁳󠁣󠁴󠁿")
        XCTAssertEqual(search("gbwls").first, "🏴󠁧󠁢󠁷󠁬󠁳󠁿")
        XCTAssertEqual(search("usca").first, "🏴󠁵󠁳󠁣󠁡󠁿")
        XCTAssertEqual(search("rukda").first, "🏴󠁲󠁵󠁫󠁤󠁡󠁿")
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
    
    func testIdeographSearch() {
        XCTAssert(search("nǐ").contains("你"))
        XCTAssert(search("hǎo").contains("好"))
        XCTAssert(search("你hǎo").contains("好"))
    }
    
    func testUnihanSortByTotalStrokes() {
        let searchResult = search("nǐ")
        XCTAssert(searchResult.firstIndex(of: "你")! < searchResult.firstIndex(of: "䕥")!)
    }
    
    func testUnihanSortByFrequency() {
        let searchResult = search("nǐ")
        XCTAssert(searchResult.firstIndex(of: "你")! < searchResult.firstIndex(of: "伱")!)
    }
}

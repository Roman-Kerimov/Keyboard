//
//  UnicodeDataTests.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-11-15.
//

import XCTest
@testable import KeyboardModule
@testable import UnicodeData
import CoreData

class UnicodeDataTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAnnotations() {
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🗨️", language: "en_CA")?.annotation,
            "dialogue | left speech bubble | speech"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🗨️", language: "en_CA")?.ttsAnnotation,
            "left speech bubble"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🗨️", language: "en")?.ttsAnnotation,
            "left speech bubble"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🤨", language: "en_001")?.ttsAnnotation,
            "face with raised eyebrow"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🐊", language: "ru_Cyrl")?.ttsAnnotation,
            "крокодил"
        )
    }
    
    func testMandarinReadings() {
        XCTAssertEqual(UnicodeData.default.item(codePoints: "你", language: "zh")?.annotation, "nǐ")
        XCTAssertEqual(UnicodeData.default.item(codePoints: "好", language: "zh")?.annotation, "hǎo")
    }
    
    func testNameAliases() {
        XCTAssertEqual(
            UnicodeData.default.item(name: "LATIN CAPITAL LETTER OI")?.localizedName,
            "LATIN CAPITAL LETTER GHA"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(name: "ZERO WIDTH NO-BREAK SPACE")?.localizedName,
            "BOM | BYTE ORDER MARK | ZWNBSP | ZERO WIDTH NO-BREAK SPACE"
        )
        
        XCTAssertEqual(
            UnicodeData.default.item(name: "VARIATION SELECTOR-17")?.localizedName,
            "VS17 | VARIATION SELECTOR-17"
        )
    }
    
    func testItemOrder() {
        XCTAssertEqual(
            UnicodeData.default.item(codePoints: "🐊", language: "en"),
            UnicodeData.default.item(codePoints: "🐊", language: "ru_Cyrl")
        )
    }
    
    func testWords() {
        let request: NSFetchRequest<ManagedWord> = ManagedWord.fetchRequest()
        request.predicate = NSPredicate(format: "string MATCHES %@", "\\B.*\\B")
        XCTAssertEqual(try! UnicodeData.default.backgroundContext.fetch(request).map{$0.string!}.sorted(), ["్", "್"])
    }
    
    func testWordsForDuplicates() {
        let words = UnicodeData.default.words(language: "ru")
        
        XCTAssertEqual(words.count, Set(words).count)
    }
    
    func testYofication() {
        XCTAssertEqual(UnicodeData.default.words(language: "ru").filter {$0.contains("ё")}.count, 193)
        
        XCTAssertEqual(
            UnicodeData.default.items(
                language: "ru_Latn",
                regularExpression: .contains(word: "vse"),
                exclude: [],
                fetchLimit: 0
            )
            .map(\.codePoints),
            []
        )
    }
}

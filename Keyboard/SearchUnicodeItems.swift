//
//  SearchUnicodeItems.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class SearchUnicodeItems: Operation {
    
    let characterSearch: CharacterSearch
    let text: String
    
    init(characterSearch: CharacterSearch, text: String) {
        self.characterSearch = characterSearch
        self.text = text
        
        super.init()
        
        self.completionBlock = {
            characterSearch.isSearching = false
        }
    }
    
    private func waitUntilTyping() {
        usleep(600_000)
    }
    
    override func main() {
        UnicodeData.default.waitUntilLoadingIsFinished()
        
        waitUntilTyping()
        
        characterSearch.scriptCodeLength = 0
        
        guard !isCancelled else {
            return
        }
        
        characterSearch.isSearching = true
        
        let maxCount = 200
        
        var foundUnicodeItems: [UnicodeItem] = [] {
            didSet {
                characterSearch.foundUnicodeItems = foundUnicodeItems
                
                if foundUnicodeItems.count >= maxCount {
                    cancel()
                }
            }
        }
        
        if let flagItem = UnicodeData.default.flagItem(regionCode: text, language: Locale.current.language.rawValue) {
            foundUnicodeItems.append(flagItem)
            
            let regionCode = text.prefix(2).uppercased()
            
            for localeIdentifier in (Foundation.Locale.availableIdentifiers.filter { $0.hasSuffix(regionCode) } + ["en_\(regionCode)"]) {
                if let currencySymbol = Foundation.Locale.init(identifier: localeIdentifier).currencySymbol {
                    if currencySymbol.count == 1, let currencyItem = UnicodeData.default.item(codePoints: currencySymbol, language: Locale.current.language.rawValue) {
                        foundUnicodeItems.append(currencyItem)
                        break
                    }
                }
            }
        }
        
        func languages(regularExpression: NSRegularExpression) -> [String] {
            var languages: [String] = []
            
            var languageSet = UnicodeData.default.languages(regularExpression: regularExpression)
            
            let currentLanguage = Locale.current.language.rawValue
            
            let prefferedLanguages = Language.preferredList.compactMap {$0.rawValue != currentLanguage ? $0.rawValue : nil}
            
            for language in [currentLanguage] + prefferedLanguages {
                if languageSet.contains(language) {
                    languages.append(language)
                    languageSet.remove(language)
                }
            }
            
            languages.append(contentsOf: languageSet.sorted())
            
            return languages
        }
        
        switch text.count {
        case 0:
            foundUnicodeItems = characterSearch.currentLastUsedCharacters.compactMap {
                if let item = characterSearch.lastUsedUnicodeItemsCache[$0] {
                    return item
                }
                else if let item = UnicodeData.default.item(codePoints: $0, language: Locale.current.language.rawValue) {
                    foundUnicodeItems.append(item)
                    characterSearch.lastUsedUnicodeItemsCache[$0] = item
                    return item
                }
                else {
                    return nil
                }
            }
            
            return
            
        case 1, 2:
            for language in languages(regularExpression: .contains(word: text)) {
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .contains(word: text), exclude: foundUnicodeItems, fetchLimit: maxCount)
            }
            
        default:
            
            for language in languages(regularExpression: .containsWord(withPrefix: text)) {
                
                guard !isCancelled else {
                    return
                }
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .contains(word: text), exclude: foundUnicodeItems, fetchLimit: maxCount)
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .containsWord(withPrefix: text), exclude: foundUnicodeItems, fetchLimit: maxCount)
            }
        }
        
    }
}

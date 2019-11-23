//
//  SearchUnicodeScalars.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class SearchUnicodeScalars: Operation {
    
    let characterSearch: CharacterSearch
    let text: String
    
    init(characterSearch: CharacterSearch, text: String) {
        self.characterSearch = characterSearch
        self.text = text
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
        
        var foundUnicodeItems: [UnicodeItem] = []
        
        func flag(fromRegionCode regionCode: String) -> String {
            if regionCode.count == 2 {
                return regionCode.uppercased().unicodeScalars.map {Unicode.Scalar($0.value + 0x1F1A5)?.description ?? "_"} .joined()
            }
            else {
                return "\u{1F3F4}" + regionCode.unicodeScalars.map {Unicode.Scalar($0.value + 0xE0000)?.description ?? "_"} .joined() + "\u{E007F}"
            }
        }
        
        if let flagItem = UnicodeData.default.item(codePoints: flag(fromRegionCode: text), language: Locale.current.language.rawValue) {
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
        
        func updateUnicodeCollectionView() {
            characterSearch.foundUnicodeItems = foundUnicodeItems
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
                
                let item = UnicodeData.default.item(codePoints: $0, language: Locale.current.language.rawValue)
                characterSearch.lastUsedUnicodeItemsCache[$0] = item
                return item
            }
            updateUnicodeCollectionView()
            return
            
        case 1, 2:
            for language in languages(regularExpression: .contains(word: text)) {
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .contains(word: text), exclude: foundUnicodeItems)
            }
            
        default:
            
            for language in languages(regularExpression: .containsWord(withPrefix: text)) {
                
                guard !isCancelled else {
                    return
                }
                
                for scriptCodeLength in 2...3 {
                    let scriptCode: String = .init(text.suffix(scriptCodeLength).description.lowercased().flatMap {$0.removing(characterComponents: CharacterComponent.scripts)} )
                    
                    guard let scriptCharacterComponent = codeScriptDictionary[scriptCode] else {
                        continue
                    }
                    
                    let letter = text.dropLast(scriptCodeLength).last!.description
                    
                    let targetLetter = letter.appending(characterComponent: scriptCharacterComponent)
                    
                    guard targetLetter != letter else {
                        break
                    }
                    
                    foundUnicodeItems.append(UnicodeData.default.item(codePoints: targetLetter, language: Locale.current.language.rawValue)!)
                    characterSearch.scriptCodeLength = scriptCodeLength
                }
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .contains(word: text), exclude: foundUnicodeItems)
                
                updateUnicodeCollectionView()
                
                guard !isCancelled else {
                    return
                }
                
                foundUnicodeItems += UnicodeData.default.items(language: language, regularExpression: .containsWord(withPrefix: text), exclude: foundUnicodeItems)
            }
        }
        
        guard !isCancelled else {
            return
        }
        
        updateUnicodeCollectionView()
    }
}

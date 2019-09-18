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
    
    override func main() {
        UnicodeData.default.waitUntilLoadingIsFinished()
        
        characterSearch.scriptCodeLength = 0
        
        guard !isCancelled else {
            return
        }
        
        var foundCharacters: [Character] = .init()
        
        func flag(fromRegionCode regionCode: String) -> String {
            if regionCode.count == 2 {
                return regionCode.uppercased().unicodeScalars.map {Unicode.Scalar($0.value + 0x1F1A5)?.description ?? "_"} .joined()
            }
            else {
                return "\u{1F3F4}" + regionCode.unicodeScalars.map {Unicode.Scalar($0.value + 0xE0000)?.description ?? "_"} .joined() + "\u{E007F}"
            }
        }
        
        if let flag = UnicodeData.default.sequenceItems[flag(fromRegionCode: text)]?.codePoints {
            foundCharacters.append(Character(flag))
            
            let regionCode = text.prefix(2).uppercased()
            
            for localeIdentifier in (Foundation.Locale.availableIdentifiers.filter { $0.hasSuffix(regionCode) } + ["en_\(regionCode)"]) {
                if let currencySymbol = Foundation.Locale.init(identifier: localeIdentifier).currencySymbol {
                    if currencySymbol.count == 1 {
                        foundCharacters.append(.init(currencySymbol))
                        break
                    }
                }
            }
        }
        
        func updateUnicodeCollectionView() {
            characterSearch.foundCharacters = foundCharacters
        }
        
        let searchRegularExpression: NSRegularExpression
        
        switch text.count {
        case 0:
            foundCharacters = characterSearch.currentFrequentlyUsedCharacters
            updateUnicodeCollectionView()
            return
            
        case 1:
            searchRegularExpression = .contains(word: text)
            
        case 2:
            searchRegularExpression = .contains(word: text)
            
        default:
            searchRegularExpression = .contains(text)
            
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
                
                foundCharacters.append(.init(targetLetter))
                characterSearch.scriptCodeLength = scriptCodeLength
            }
        }
        
        let foundSequenceCharacters = UnicodeData.default.sequenceItems
            .values
            .filter {!isCancelled && $0.isFullyQualified && $0.name.contains(searchRegularExpression) && $0.codePoints.count == 1}
            .map {Character.init($0.codePoints)}
        
        guard !isCancelled else {
            return
        }
        
        let foundCodePointCharacters = UnicodeData.default.codePointNames
            .filter {!isCancelled && $0.value.contains(searchRegularExpression) && !CharacterSet.emoji.contains(Unicode.Scalar.init($0.key)!)}
            .map {Character.init(Unicode.Scalar.init($0.key)!)}
        
        guard !isCancelled else {
            return
        }
        
        foundCharacters += (foundCodePointCharacters + foundSequenceCharacters).sorted { (left, right) -> Bool in
            
            guard !isCancelled else {
                return true
            }
            
            for regularExpression: NSRegularExpression in [.contains(word: text), .containsWord(withPrefix: text)] {
                
                let leftBool = left.unicodeName.contains(regularExpression)
                let rightBool = right.unicodeName.contains(regularExpression)
                if  leftBool && !rightBool {
                    return true
                }
                
                if !leftBool && rightBool {
                    return false
                }
            }
            
            let leftItem = UnicodeData.default.sequenceItems[left.description]
            let rightItem = UnicodeData.default.sequenceItems[right.description]
            
            if let leftItem = leftItem, let rightItem = rightItem {
                return leftItem < rightItem
            }
            else if let _ = leftItem {
                return true
            }
            else if let _ = rightItem {
                return false
            }
            
            return left < right
        }
        
        guard !isCancelled else {
            return
        }
        
        updateUnicodeCollectionView()
    }
}

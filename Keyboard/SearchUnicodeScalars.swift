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
        
        var foundUnicodeItems: [UnicodeItem] = []
        
        func flag(fromRegionCode regionCode: String) -> String {
            if regionCode.count == 2 {
                return regionCode.uppercased().unicodeScalars.map {Unicode.Scalar($0.value + 0x1F1A5)?.description ?? "_"} .joined()
            }
            else {
                return "\u{1F3F4}" + regionCode.unicodeScalars.map {Unicode.Scalar($0.value + 0xE0000)?.description ?? "_"} .joined() + "\u{E007F}"
            }
        }
        
        func updateUnicodeCollectionView() {
            characterSearch.foundUnicodeItems = foundUnicodeItems
        }
        
        if let flagItem = UnicodeData.default.item(byCodePoints: flag(fromRegionCode: text)) {
            foundUnicodeItems.append(flagItem)
            
            let regionCode = text.prefix(2).uppercased()
            
            for localeIdentifier in (Foundation.Locale.availableIdentifiers.filter { $0.hasSuffix(regionCode) } + ["en_\(regionCode)"]) {
                if let currencySymbol = Foundation.Locale.init(identifier: localeIdentifier).currencySymbol {
                    if currencySymbol.count == 1, let currencyItem = UnicodeData.default.item(byCodePoints: currencySymbol) {
                        foundUnicodeItems.append(currencyItem)
                        break
                    }
                }
            }
        }
        
        updateUnicodeCollectionView()
        
        let searchRegularExpression: NSRegularExpression
        
        switch text.count {
        case 0:
            foundUnicodeItems = characterSearch.currentFrequentlyUsedUnicodeItems
            updateUnicodeCollectionView()
            return
            
        case 1, 2:
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
                
                foundUnicodeItems.append(UnicodeData.default.item(byCodePoints: targetLetter)!)
                characterSearch.scriptCodeLength = scriptCodeLength
            }
        }
        
        foundUnicodeItems += UnicodeData.default.items.filter {!isCancelled && $0.isFullyQualified && $0.name.contains(searchRegularExpression)} .sorted { (leftItem, rightItem) -> Bool in
            
            guard !isCancelled else {
                return true
            }
            
            for regularExpression: NSRegularExpression in [.contains(word: text), .containsWord(withPrefix: text)] {
                
                let leftBool = leftItem.name.contains(regularExpression)
                let rightBool = rightItem.name.contains(regularExpression)
                if  leftBool && !rightBool {
                    return true
                }
                
                if !leftBool && rightBool {
                    return false
                }
            }
            
            return leftItem < rightItem
        }
        
        guard !isCancelled else {
            return
        }
        
        updateUnicodeCollectionView()
    }
}

//
//  SearchUnicodeScalars.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class SearchUnicodeScalars: Operation {
    let characterCollectionView: CharacterCollectionView
    
    init(for characterCollectionView: CharacterCollectionView) {
        self.characterCollectionView = characterCollectionView
    }
    
    override func main() {
        let text = UnicodeTable.default.textForSearch
        UnicodeTable.default.scriptCodeLength = 0
        
        guard !isCancelled else {
            return
        }
        
        var foundCharacters: [Character] = .init()
        
        func flag(fromRegionCode regionCode: String) -> Character {
            var flag: String = .init()
            
            for unicodeScalar in regionCode.unicodeScalars {
                
                let regionalIndicatorLetter: Unicode.Scalar = Unicode.Scalar.init(unicodeScalar.value + 0x1F1A5)!
                
                flag.append(regionalIndicatorLetter.description)
            }
            
            return .init(flag)
        }
        
        func updateUnicodeCollectionView() {
            DispatchQueue.main.async {
                self.characterCollectionView.characters = foundCharacters
            }
            
            if Bundle.main.isInterfaceBuilder {
                characterCollectionView.characters = foundCharacters
            }
        }
        
        let searchRegularExpression: NSRegularExpression
        
        switch text.count {
        case 0:
            foundCharacters = UnicodeTable.default.frequentlyUsedCharacters
            updateUnicodeCollectionView()
            return
            
        case 1:
            searchRegularExpression = .contains(word: text)
            
        case 2:
            searchRegularExpression = .contains(word: text)
            
            if Locale.regionCodes.contains(text) {
                foundCharacters.append(flag(fromRegionCode: text))
                
                for localeIdentifier in (Locale.availableIdentifiers.filter { $0.hasSuffix(text) } + ["en_\(text)"]) {
                    if let currencySymbol = Locale.init(identifier: localeIdentifier).currencySymbol {
                        if currencySymbol.count == 1 {
                            foundCharacters.append(.init(currencySymbol))
                            break
                        }
                    }
                }
            }
            
        default:
            searchRegularExpression = .contains(text)
            
            for scriptCodeLength in 2...3 {
                let scriptCode: String = .init(text.suffix(scriptCodeLength).description.lowercased().flatMap {$0.characterComponents.removing(characterComponents: CharacterComponent.scripts).character} )
                
                guard let scriptCharacterComponent = codeScriptDictionary[scriptCode] else {
                    continue
                }
                
                let letter = text.dropLast(scriptCodeLength).last!.description
                
                let targetLetter = letter.appending(characterComponent: scriptCharacterComponent)
                
                guard targetLetter != letter else {
                    break
                }
                
                foundCharacters.append(.init(targetLetter))
                UnicodeTable.default.scriptCodeLength = scriptCodeLength
            }
        }
        
        let foundSequenceCharacters = UnicodeTable.default.sequenceItems
            .values
            .filter {!isCancelled && $0.isFullyQualified && $0.name.contains(searchRegularExpression) && $0.codePoints.count == 1}
            .map {Character.init($0.codePoints)}
        
        guard !isCancelled else {
            return
        }
        
        let foundCodePointCharacters = UnicodeTable.default.codePointNames
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
            
            let leftItem = UnicodeTable.default.sequenceItems[left.description]
            let rightItem = UnicodeTable.default.sequenceItems[right.description]
            
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

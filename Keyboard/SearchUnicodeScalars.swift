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
            if characterCollectionView.characters != foundCharacters {
                OperationQueue.main.addOperation {
                    self.characterCollectionView.characters = foundCharacters
                }
            }
        }
        
        guard !text.isEmpty else {
            foundCharacters = UnicodeTable.default.frequentlyUsedCharacters
            updateUnicodeCollectionView()
            return
        }
        
        if text.count == 2 && Locale.regionCodes.contains(text) {
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
        
        let foundSequenceCharacters = UnicodeTable.default.sequenceItems
            .values
            .filter {!isCancelled && $0.isFullyQualified && $0.name.localizedCaseInsensitiveContains(text) && $0.codePoints.count == 1}
            .map {Character.init($0.codePoints)}
        
        guard !isCancelled else {
            return
        }
        
        let foundCodePointCharacters = UnicodeTable.default.codePointNames
            .filter {!isCancelled && $0.value.contains(text) && !CharacterSet.emoji.contains(Unicode.Scalar.init($0.key)!)}
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

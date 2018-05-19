//
//  SearchUnicodeScalars.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class SearchUnicodeScalars: Operation {
    let characterCollectionView: CharacterCollectionView
    
    let sortOrder: [CharacterSet] = [
        .emoticons,
        .emoji,
        ]
    
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
        
        func findCharacters(whereWord: (String) -> Bool) -> [Character] {
            var output = UnicodeTable.default.unicodeNameIndex
                .filter { whereWord($0.word) }
                .map {$0.stringWithUnicodeScalars}
                .joined()
                .unicodeScalars.map {Character.init($0)}
            
            output += Locale.regionCodes.filter {
                let regionName = Locale.init(identifier: "en").localizedString(forRegionCode: $0)!.uppercased()
                return foundCharacters.first ?? .space != flag(fromRegionCode: $0)
                    && (regionName.hasPrefix(text) || regionName.contains(.space + text) || regionName.contains("-" + text))
                }.map {
                    flag(fromRegionCode: $0)
            }
            
            output.sort {
                guard !isCancelled else {
                    return true
                }
                
                for characterSet in sortOrder {
                    if $0.belongsTo(characterSet) && $1.belongsTo(characterSet) {
                        return $0 < $1
                    }
                    else if $0.belongsTo(characterSet) && !$1.belongsTo(characterSet) {
                        return true
                    }
                    else if !$0.belongsTo(characterSet) && $1.belongsTo(characterSet) {
                        return false
                    }
                }
                
                return $0 < $1
            }
            
            return output
        }
        
        func updateUnicodeCollectionView() {
            if characterCollectionView.characters != foundCharacters {
                OperationQueue.main.addOperation {
                    self.characterCollectionView.characters = foundCharacters
                }
            }
        }
        
        if text == "" {
            foundCharacters = UnicodeTable.default.frequentlyUsedCharacters
        }
        else {
            
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
            
            foundCharacters += findCharacters(whereWord: {$0.hasPrefix(text) } )
        }
        
        guard !isCancelled else {
            return
        }
        
        updateUnicodeCollectionView()
        
        if text != "" {
            foundCharacters += findCharacters(whereWord: { !$0.hasPrefix(text) && $0.contains(text) } )
        }
        
        guard !isCancelled else {
            return
        }
        
        updateUnicodeCollectionView()
    }
}

//
//  UnicodeTable.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import UIKit

class UnicodeTable: NSObject {
    
    public static let `default`: UnicodeTable = .init()
    
    internal var unicodeNameIndex: [(word: String, stringWithUnicodeScalars: String)] = .init()
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    private override init() {
        super.init()
        
        backgroudOperationQueue.addOperation( LoadUnicodeNameIndex() )
    }

    internal var textForSerch: String = .init() {
        didSet {
            
            if oldValue == "" && textForSerch == "" {
                return
            }
            
            frequentlyUsedCharacters = KeyboardSettings.shared.frequentlyUsedCharacters
        }
    }
    
    internal var frequentlyUsedCharacters: [Character] = KeyboardSettings.shared.frequentlyUsedCharacters
    
    public func searchScalars(byName text: String, for characterCollectionView: CharacterCollectionView) {
        if let searchUnicodeScalarsOperation = backgroudOperationQueue.operations.last as? SearchUnicodeScalars {
            searchUnicodeScalarsOperation.cancel()
        }
        
        textForSerch = text.uppercased()
        
        backgroudOperationQueue.addOperation( SearchUnicodeScalars.init(for: characterCollectionView) )
    }
}

private class LoadUnicodeNameIndex: Operation {
    
    override func main() {
        
        guard !isCancelled else {
            return
        }
        
        let unicodeNameIndexKey = "Ao7ozOMvHyuaIKDX06B90pz9nmMe8yX"
        let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let unicodeNameIndexURL = documentDirectoryURL.appendingPathComponent(unicodeNameIndexKey)
        
        var wordDictionary: [String: String] = .init()
        
        if let unicodeNameIndex = NSKeyedUnarchiver.unarchiveObject(withFile: unicodeNameIndexURL.path) as? [String: String] {
            
            wordDictionary = unicodeNameIndex
        }
        else {
            
            forScalarInUnicodeRange { (unicodeScalar) in
                
                for word in unicodeScalar.description
                    .applyingTransform(.toUnicodeName, reverse: false)!
                    .replacingOccurrences(of: "\\N{", with: String.space)
                    .replacingOccurrences(of: "}", with: String.space)
                    .components(separatedBy: String.space) {
                        
                        guard word != "" else {
                            continue
                        }
                        
                        var word: String = word
                        
                        let IDEOGRAPH = "IDEOGRAPH"
                        if word.hasPrefix("\(IDEOGRAPH)-") {
                            word = IDEOGRAPH
                        }
                        
                        if wordDictionary[word] != nil {
                            wordDictionary[word]! += .init(unicodeScalar.description)
                        }
                        else {
                            wordDictionary[word] = .init(unicodeScalar.description)
                        }
                }
            }
            
            NSKeyedArchiver.archiveRootObject(wordDictionary, toFile: unicodeNameIndexURL.path)
        }
        
        UnicodeTable.default.unicodeNameIndex = wordDictionary.sorted { $0.key < $1.key } .map { ($0.key, $0.value) }
    }
    
    private func forScalarInUnicodeRange(perform: (UnicodeScalar) -> Void) {
        for code in 0xA1...0x10FFFF {
            autoreleasepool {
                if let unicodeScalar = UnicodeScalar.init(code) {
                    if unicodeScalar.description.applyingTransform(.toUnicodeName, reverse: false)?.contains("<") == false {
                        
                        perform(unicodeScalar)
                    }
                }
            }
        }
    }
}

private class SearchUnicodeScalars: Operation {
    let characterCollectionView: CharacterCollectionView
    
    let sortOrder: [CharacterSet] = [
        .emoticons,
        .emoji,
    ]
    
    init(for characterCollectionView: CharacterCollectionView) {
        self.characterCollectionView = characterCollectionView
    }
    
    override func main() {
        let text = UnicodeTable.default.textForSerch
        
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

//
//  UnicodeTable.swift
//  Keyboard
//
//  Created by Roman Kerimov on 01.06.17.
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
    
    internal var frequentlyUsedCharacters: [String] = KeyboardSettings.shared.frequentlyUsedCharacters
    
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
                    .replacingOccurrences(of: "\\N{", with: .space)
                    .replacingOccurrences(of: "}", with: .space)
                    .components(separatedBy: .space) {
                        
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
    
    init(for characterCollectionView: CharacterCollectionView) {
        self.characterCollectionView = characterCollectionView
    }
    
    override func main() {
        let text = UnicodeTable.default.textForSerch
        
        guard !isCancelled else {
            return
        }
        
        var unicodeScalars: [String] = .init()
        
        if text == "" {
            unicodeScalars = UnicodeTable.default.frequentlyUsedCharacters
        }
        else {
            unicodeScalars += UnicodeTable.default.unicodeNameIndex
                .filter { $0.word.hasPrefix(text) }
                .map {$0.stringWithUnicodeScalars}
                .reduce(.init(), +)
                .unicodeScalars.map {$0.description}
        }
        
        guard !isCancelled else {
            return
        }
        
        OperationQueue.main.addOperation {
            self.characterCollectionView.characters = unicodeScalars
        }
        
        if text != "" {
            unicodeScalars += UnicodeTable.default.unicodeNameIndex
                .filter { $0.word.hasPrefix(text) == false && $0.word.contains(text) }
                .map {$0.stringWithUnicodeScalars}
                .reduce(.init(), +)
                .unicodeScalars.map {$0.description}
        }
        
        guard !isCancelled else {
            return
        }
        
        OperationQueue.main.addOperation {
            self.characterCollectionView.characters = unicodeScalars
        }
    }
}

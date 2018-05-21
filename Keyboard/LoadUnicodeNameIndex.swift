//
//  LoadUnicodeNameIndex.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeNameIndex: Operation {
    
    override func main() {
        
        guard !isCancelled else {
            return
        }
        
        let unicodeNameIndexURL = URL.applicationSupport.appendingPathComponent("Ao7ozOMvHyuaIKDX06B90pz9nmMe8yX")
        
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

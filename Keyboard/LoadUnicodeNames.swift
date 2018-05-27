//
//  LoadUnicodeNames.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeNames: Operation {
    
    override func main() {
        
        guard !isCancelled else {
            return
        }
        
        let codePointNamesURL = URL.applicationSupport.appendingPathComponent("fM0jFaTnIpTeLJoQ7IF3z3l6tNCPrPG")
        
        if let codePointNames = NSKeyedUnarchiver.unarchiveObject(withFile: codePointNamesURL.path) as? [UInt32: String] {
            UnicodeTable.default.codePointNames = codePointNames
        }
        else {
            
            let derivedNameURL = Bundle.main.url(forResource: "DerivedName", withExtension: "txt")!
            let derivedNameStrings = (try! String.init(contentsOf: derivedNameURL)).split(separator: .return)
            
            for string in derivedNameStrings {
                
                let elements = string.split(separator: .semicolon).map {$0.trimmingCharacters(in: .whitespaces)}
                
                guard elements.count == 2 else {
                    continue
                }
                
                var codePoint: UInt32 = 0
                guard Scanner.init(string: elements.first!).scanHexInt32(&codePoint) else {
                    continue
                }
                
                UnicodeTable.default.codePointNames[codePoint] = elements.last!
            }
            
            NSKeyedArchiver.archiveRootObject(UnicodeTable.default.codePointNames, toFile: codePointNamesURL.path)
        }
    }
}

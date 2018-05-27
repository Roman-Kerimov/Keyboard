//
//  LoadUnicodeDataFiles.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    
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
            
            for (index, string) in derivedNameStrings.enumerated() {
                
                let progress: Float = .init(index + 1) / .init(derivedNameStrings.count)
                NotificationCenter.default.post(name: .UnicodeDataFilesLoadingProgressDidChange, object: progress)
                
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

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
}

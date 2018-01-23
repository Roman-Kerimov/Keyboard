//
//  Locale.swift
//  Keyboard
//
//  Created by Roman Kerimov on 28/06/2017.
//

import Foundation

extension Locale {
    
    static var regionCodes: [String] {
        let capitalLetters: [Character] = .init("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        let enLocale: Locale = .init(identifier: "en")
        
        let enISORegionNames = Locale.isoRegionCodes.map { enLocale.localizedString(forRegionCode: $0)! }
        
        var output: [String] = Locale.isoRegionCodes
        
        for firstLetter in capitalLetters {
            for secondLetter in capitalLetters {
                let twoLetterCode = firstLetter.description + secondLetter.description
                if let regionName = enLocale.localizedString(forRegionCode: twoLetterCode)  {
                    if enISORegionNames.contains(regionName) == false {
                        output.append(twoLetterCode)
                    }
                }
            }
        }
        
        return output
    }
}

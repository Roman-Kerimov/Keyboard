//
//  Foundation.Locale.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-28.
//

import Foundation

extension Foundation.Locale {
    
    static var regionCodes: [String] {
        let capitalLetters: [Character] = .init("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        
        let enLocale: Self = .init(identifier: "en")
        
        let enISORegionNames = Self.isoRegionCodes.map { enLocale.localizedString(forRegionCode: $0)! }
        
        var output: [String] = Self.isoRegionCodes
        
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

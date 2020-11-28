//
//  Locale.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-01-02.
//

import Foundation

extension Locale {
    public static let componentSeparator = "-"
    
    public var compatibleIdentifiers: [String] {
        return [
            [languageCode, scriptCode, regionCode],
            [languageCode, scriptCode],
            [languageCode, regionCode],
            [languageCode],
        ].compactMap({$0.contains(nil) ? nil : $0.compactMap {$0}}).map({$0.joined(separator: Locale.componentSeparator)})
    }
    
    static var preferredLanguages: [String] {
        Self.extendedIdentifiers(fromIdentifiers: UserDefaults.standard.array(forKey: "AppleLanguages") as! [String])
    }
    
    static func extendedIdentifiers(fromIdentifiers sourceIdentifiers: [String]) -> [String] {
        var targetIdentifiers: [String] = []
        
        let dictionary: [String: String] = ["ru": "ru-Latn"]
        
        for sourceIdentifier in sourceIdentifiers {
            targetIdentifiers.append(sourceIdentifier)
            
            for (source, target) in dictionary {
                if sourceIdentifier == source {
                    targetIdentifiers.append(target)
                }
                else {
                    let targetIdentifier = sourceIdentifier.replacingOccurrences(of: source + componentSeparator, with: target + componentSeparator)
                    if targetIdentifier != sourceIdentifier {
                        targetIdentifiers.append(targetIdentifier)
                    }
                }
            }
        }
        
        return targetIdentifiers
    }
}

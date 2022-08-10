//
//  KeyboardXMLParser.swift
//  BuildUnicodeData
//
//  Created by Roman Kerimov on 2020-01-31.
//

import Foundation

class KeyboardXMLParser: XMLParser {
    override init(data: Data) {
        super.init(data: data)
        
        delegate = self
    }
    
    var locale: String = ""
    
    var keyboardSet: Set<String> = []
    
    static var keyboardIntersectionSets: [String: Set<String>] = [:]
}

extension KeyboardXMLParser: XMLParserDelegate {
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        switch elementName {
        case "keyboard":
            locale = attributeDict["locale"]!.components(separatedBy: "-t-").first!
            
        case "map", "transform":
            guard !locale.isEmpty else {
                abortParsing()
                return
            }
            
            var characters = [attributeDict["to"]!]
            
            if let longPress = attributeDict["longPress"] {
                characters += longPress.components(separatedBy: .whitespaces)
            }
            
            characters = characters.map { character in
                character
                    .replacingOccurrences(of: "\\u{", with: "\\x{")
                    .applyingTransform(StringTransform("Hex/Perl-Any"), reverse: false)!
            }
            
            keyboardSet.formUnion(characters)
            
        default:
            break
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        if locale.isEmpty {
            return
        }
        
        if Self.keyboardIntersectionSets[locale] == nil {
            Self.keyboardIntersectionSets[locale] = keyboardSet
        } else {
            Self.keyboardIntersectionSets[locale]!.formIntersection(keyboardSet)
        }
    }
}


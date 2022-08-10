//
//  MainXMLParser.swift
//  BuildUnicodeData
//
//  Created by Roman Kerimov on 2020-02-07.
//

import Foundation
import UnicodeData

class MainXMLParser: XMLParser {
    override init(data: Data) {
        super.init(data: data)
        
        delegate = self
    }
    
    private var isIdentity = false
    private var locale = ""
    
    private var text: String = ""
    
    private var subdivision: String = ""
    private var subdivisionNames: [String: String] = [:]
    static var subdivisions: [String: [String: String]] = [:]
    
    private var exemplarCharactersType: String = ""
    private var charactersDictionary: [String: [String]] = [:]
}

extension MainXMLParser: XMLParserDelegate {
    
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        
        text = ""
        
        switch elementName {
        case "subdivision":
            subdivision = attributeDict["type"]!
            
        case "exemplarCharacters":
            exemplarCharactersType = attributeDict["type"] ?? "main"
            
        case "identity":
            isIdentity = true
            
        case "language":
            guard isIdentity else {
                return
            }
            
            locale = attributeDict["type"]!
            
        case "script", "territory":
            guard isIdentity else {
                return
            }
            
            locale = [locale, attributeDict["type"]].compactMap({$0}).joined(separator: Locale.componentSeparator)
            
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        text.append(string)
    }
    
    func parser(
        _ parser: XMLParser,
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?
    ) {
        
        switch elementName {
            
        case "subdivision":
            subdivisionNames[subdivision] = text
            
        case "subdivisions":
            Self.subdivisions[locale] = subdivisionNames
            
        case "exemplarCharacters":
            
            func removeCurlyBracket1(text: String) -> String {
                var letter = text
                
                if letter.hasPrefix("{") {
                    letter.removeFirst()
                    
                    if let index = letter.firstIndex(of: "}") {
                        letter.remove(at: index)
                    }
                }
                
                return letter
            }
            
            func removeCurlyBracket2(text: String) -> String {
                var letter = text
                
                if letter.hasSuffix("}") {
                    letter.removeLast()
                    
                    if let index = letter.lastIndex(of: "{") {
                        letter.remove(at: index)
                    }
                }
                
                return letter
            }
            
            charactersDictionary[exemplarCharactersType] = text.dropFirst().dropLast()
                .components(separatedBy: .whitespaces)
                .map(removeCurlyBracket1(text:))
                .map(removeCurlyBracket2(text:))
                .map {$0.applyingTransform(StringTransform("Hex-Any"), reverse: false)!}
                .map {$0.hasPrefix("\\") ? String($0.dropFirst()) : $0}
            
        case "characters":
            let characterCollection = UnicodeData.default.createCharacterCollection(language: locale)
            
            charactersDictionary.forEach { (type, characters) in
                characterCollection.setValue(characters, forKey: type)
            }
            
            BuildUnicodeData.characterCollectionsByLocale[locale] = characterCollection
            
        case "identity":
            isIdentity = false
            
        default:
            break
        }
    }
}

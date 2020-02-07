//
//  MainXMLParser.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2020-02-07.
//

import Foundation

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
}

extension MainXMLParser: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        text = ""
        
        switch elementName {
        case "subdivision":
            subdivision = attributeDict["type"]!
            
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
            
            locale = [locale, attributeDict["type"]].compactMap({$0}).joined(separator: Foundation.Locale.componentSeparator)
            
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        text.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
            
        case "subdivision":
            subdivisionNames[subdivision] = text
            
        case "subdivisions":
            Self.subdivisions[locale] = subdivisionNames
            
        case "identity":
            isIdentity = false
            
        default:
            break
        }
    }
}

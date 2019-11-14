//
//  AnnotationsXMLParser.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2019-09-14.
//

import Foundation
import LinguisticKit

class AnnotationsXMLParser: XMLParser {
    override init(data: Data) {
        super.init(data: data)
        
        delegate = self
    }
    private var language: String = ""
    
    private var codePoints: String? = nil {
        willSet {
            guard codePoints != newValue, let codePoints = codePoints else {
                return
            }
            
            if annotation.count < ttsAnnotation.count {
                annotation = "\(annotation) | \(ttsAnnotation)"
            }
            
            UnicodeData.default.addAnnotation(text: annotation, textToSpeech: ttsAnnotation, language: language, codePoints: codePoints)
            
            wordSet.formUnion(annotation.components(separatedBy: .whitespaces))

            isTTS = false
            annotation = ""
            ttsAnnotation = ""
        }
    }
    
    private var isTTS: Bool = false
    private var annotation: String = ""
    private var ttsAnnotation: String = ""
    
    private var wordSet: Set<String> = .init()
    
    static var toFullyQualifiedDictionary: [String: String] = .init()
}

extension AnnotationsXMLParser: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        switch elementName {
        case "annotation":
            let cp = attributeDict["cp"]!
            codePoints = AnnotationsXMLParser.toFullyQualifiedDictionary[cp] ?? cp
            isTTS = attributeDict["type"] == "tts"
            
        case "language":
            language = attributeDict["type"] ?? ""
            
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard codePoints != nil else {
            return
        }
        
        if isTTS {
            ttsAnnotation.append(string)
        }
        else {
            annotation.append(string)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        codePoints = nil
        
        wordSet.forEach { (word) in
            UnicodeData.default.addWord(word, language: language)
        }
    }
}

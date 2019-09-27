//
//  AnnotationsXMLParser.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-09-14.
//

import Foundation

class AnnotationsXMLParser: XMLParser {
    override init(data: Data) {
        super.init(data: data)
        
        delegate = self
    }
    private var language: String = ""
    
    private var codePoints: String? = nil
    private var isTTS: Bool = false
    private var annotation: String = ""
    private var ttsAnnotation: String = ""
}

extension AnnotationsXMLParser: XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        switch elementName {
        case "annotation":
            codePoints = attributeDict["cp"]
            isTTS = attributeDict["type"] == "tts"
            
        case "language":
            language = attributeDict["type"] ?? ""
            
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "annotation":
            if isTTS {
                
                UnicodeData.default.addAnnotation(text: annotation, textToSpeech: ttsAnnotation, language: language, codePoints: codePoints!)

                isTTS = false
                annotation = ""
                ttsAnnotation = ""
            }
            
            codePoints = nil
            
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
}

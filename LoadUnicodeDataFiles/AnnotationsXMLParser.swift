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
    
    private static var baseLanguage: String = "" {
        didSet {
            if oldValue != baseLanguage {
                annotationTable = .init()
            }
        }
    }
    
    private static var annotationTable: [String: String] = .init()
    private static var flagTemplates: [String: (annotation: String, ttsAnnotation: String, placeholder: String)] = .init()
    
    private var language: String = ""
    
    private var codePoints: String? = nil {
        willSet {
            guard codePoints != newValue, let codePoints = codePoints else {
                return
            }
            
            let languageComponents = language.components(separatedBy: Locale.componentSeparator)
            
            func annotationKey(languageComponents: [String], isTTS: Bool) -> String {
                return "\(codePoints)\(languageComponents.joined(separator: Locale.componentSeparator))\(isTTS)"
            }
            
            func normalize(text: inout String, isTTS: Bool) {
                text = text.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if ["↑↑↑", ""].contains(text) {
                    var baseLanguageComponents = languageComponents
                    baseLanguageComponents.removeLast()
                    
                    while !baseLanguageComponents.isEmpty {
                        if let annotation = AnnotationsXMLParser.annotationTable[annotationKey(languageComponents: baseLanguageComponents, isTTS: isTTS)] {
                            text = annotation
                            break
                        }
                        
                        baseLanguageComponents.removeLast()
                    }
                }
            }
            
            normalize(text: &annotation, isTTS: false)
            normalize(text: &ttsAnnotation, isTTS: true)
            
            if annotation.count < ttsAnnotation.count {
                annotation = "\(annotation) | \(ttsAnnotation)"
            }
            
            var words = annotation.words
            
            if language == "ru" {
                words.enumerated().forEach { (offset, word) in
                    guard let yoficatedWord = yoficationTable[word] else {
                        return
                    }
                    
                    words[offset] = yoficatedWord
                    
                    func yotificate(text: inout String) {
                        text = try! NSRegularExpression(pattern: "\\b\(NSRegularExpression.escapedPattern(for: word))\\b", options: []).stringByReplacingMatches(in: text, options: [], range: .init(location: 0, length: text.count), withTemplate: yoficatedWord)
                    }
                    
                    yotificate(text: &annotation)
                    yotificate(text: &ttsAnnotation)
                }
            }
            
            UnicodeData.default.addItem(codePoints: codePoints, language: language, annotation: annotation, ttsAnnotation: ttsAnnotation, order: LoadUnicodeDataFiles.ordersByCodePoints[codePoints])
            
            AnnotationsXMLParser.annotationTable[annotationKey(languageComponents: languageComponents, isTTS: false)] = annotation
            AnnotationsXMLParser.annotationTable[annotationKey(languageComponents: languageComponents, isTTS: true)] = ttsAnnotation
            
            if AnnotationsXMLParser.flagTemplates[language] == nil,
                let regionCode = UnicodeData.default.regionCode(flagCodePoints: codePoints),
                regionCode == regionCode.lowercased(),
                let subdivisionName = MainXMLParser.subdivisions[language]?[regionCode] {
                
                AnnotationsXMLParser.flagTemplates[language] = (annotation: annotation, ttsAnnotation: ttsAnnotation, placeholder: subdivisionName)
            }
            
            wordSet.formUnion(words)

            isTTS = false
            annotation = ""
            ttsAnnotation = ""
        }
    }
    
    private var subdivision: String = ""
    
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
            
        case "subdivision":
            subdivision = attributeDict["type"]!
            codePoints = UnicodeData.default.flagCodePoints(regionCode: subdivision)
            
        case "language":
            language = attributeDict["type"] ?? ""
            AnnotationsXMLParser.baseLanguage = language.components(separatedBy: Locale.componentSeparator).first!
            
        case "script", "territory":
            language = [language, attributeDict["type"]].compactMap({$0}).joined(separator: Locale.componentSeparator)
            
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
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "subdivision":
            guard let template = AnnotationsXMLParser.flagTemplates[language] ?? AnnotationsXMLParser.flagTemplates[language.components(separatedBy: Locale.componentSeparator).dropLast().joined(separator: Locale.componentSeparator)] else {
                return
            }
            
            let subdivisionName = annotation
            
            annotation = template.annotation.replacingOccurrences(of: template.placeholder, with: subdivisionName)
            
            ttsAnnotation = template.ttsAnnotation.replacingOccurrences(of: template.placeholder, with: subdivisionName)
            
        case "annotations", "subdivisions":
            codePoints = nil
            
            wordSet.subtract(UnicodeData.default.words(language: language))
            
            wordSet.forEach { (word) in
                UnicodeData.default.addWord(word, language: language)
            }
            
            abortParsing()
            
        default:
            break
        }
    }
}

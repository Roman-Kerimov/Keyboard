//
//  UnicodeDataItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-27.
//

import Foundation

enum UnicodeDataItem: String, CaseIterable {
    case emojiTest = "emoji-test.txt"
    case derivedName = "DerivedName.txt"
    case annotations
    case annotationsDerived
    
    var name: String {
        return rawValue
    }
    
    var fileURLs: [URL] {
        guard let itemURL = Bundle.main.url(forResource: name, withExtension: nil) else {
            fatalError("Unicode data item '\(name)' is not found")
        }
        
        if let urls = try? FileManager.default.contentsOfDirectory(at: itemURL, includingPropertiesForKeys: nil, options: []) {
            return urls
        }
        else {
            return [itemURL]
        }
    }
    
    var strings: [String] {
        return fileURLs.flatMap { (fileURL) -> [String] in
            return (try! String.init(contentsOf: fileURL)).split(separator: .return).map {String.init($0)}
        }
    }
    
    static let totalFileCount = allCases.map {$0.fileURLs.count}.reduce(0, +)
    
    func parse(parse: (String) -> Void) {
        for string in strings {
            
            if string.isEmpty == false && string.hasPrefix("#".description) == false {
                autoreleasepool {
                    parse(string)
                }
            }
        }
        
        processedFileCount += 1
    }
    
    func parse(using xmlParser: XMLParser.Type) {
        fileURLs.forEach { (fileURL) in
            autoreleasepool {
                xmlParser.init(contentsOf: fileURL)?.parse()
                try! UnicodeData.default.backgroundContext.save()
                processedFileCount += 1
            }
        }
    }
}

fileprivate var processedFileCount: Int = 0 {
    didSet {
        let progress: Float = .init(processedFileCount) / .init(UnicodeDataItem.totalFileCount)
        NotificationCenter.default.post(name: .UnicodeDataFilesLoadingProgressDidChange, object: progress)
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
}

//
//  LoadUnicodeDataFiles.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    let columnSeparator: Character = ";"
    let commentMarker: Character = "#"
    
    private func collectFileGarbage() {
        let fileGarbageURLs: [URL] = [
            URL.applicationSupport.appendingPathComponent(UnicodeDataFile.derivedName.name),
            URL.applicationSupport.appendingPathComponent(UnicodeDataFile.emojiTest.name),
        ]
        
        fileGarbageURLs.forEach {try? FileManager.default.removeItem(at: $0)}
    }
    
    private var processedStringCount: Int = 0 {
        didSet {
            let progress: Float = .init(processedStringCount) / .init(UnicodeDataFile.totalStringCount)
            NotificationCenter.default.post(name: .UnicodeDataFilesLoadingProgressDidChange, object: progress)
        }
    }
    
    override func main() {
        
        collectFileGarbage()
        
        if Keyboard.default.cacheVersion != Bundle.main.cacheVersion {
            try? FileManager.default.removeItem(at: UnicodeData.default.cacheURL)
            Keyboard.default.cacheVersion = Bundle.main.cacheVersion
        }
        
        if let unicodeItems = try? PropertyListDecoder.init().decode([UnicodeItem].self, from: (try? Data.init(contentsOf: UnicodeData.default.cacheURL)) ?? .init()) {
            UnicodeData.default.items = unicodeItems
            
            NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
            return
        }
        
        var emojiCharacterSet: CharacterSet = .init()
        
        for dataFile in UnicodeDataFile.allCases {
            
            guard !isCancelled else {
                return
            }
            
            switch dataFile {
                
            case .derivedName:
                parse(dataFile: dataFile) { (string) in
                    
                    let components = string.split(separator: columnSeparator).map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    guard components.count == 2 else {
                        return
                    }
                    
                    guard let unicodeScalar = components.first?.hexToUnicodeScalar else {
                        return
                    }
                    
                    guard !emojiCharacterSet.contains(unicodeScalar) else {
                        return
                    }
                    
                    UnicodeData.default.items.append(.init(codePoints: unicodeScalar.description, name: components.last!))
                }
                
            case .emojiTest:
                parse(dataFile: dataFile) { (string) in
                    
                    let components = string.split(maxSplits: 2, omittingEmptySubsequences: false) { [columnSeparator, commentMarker].contains($0) } .map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    let unicodeScalars = components[0].components(separatedBy: .whitespaces).map {$0.hexToUnicodeScalar!}
                    let sequence: String = unicodeScalars.map {$0.description} .reduce(.init(), +)
                    let isFullyQualified: Bool = components[1] == "fully-qualified"
                    let name: String = components[2].drop {$0 != .space} .description.trimmingCharacters(in: .whitespaces)
                    
                    if unicodeScalars.count == 1 {
                        emojiCharacterSet.insert(unicodeScalars.first!)
                    }
                    
                    UnicodeData.default.items.append(.init(codePoints: sequence, name: name, isFullyQualified: isFullyQualified))
                }
            }
        }
        
        if let data = try? PropertyListEncoder.init().encode(UnicodeData.default.items) {
            try! data.write(to: UnicodeData.default.cacheURL)
        }
        
        NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
    }
    
    private func parse(dataFile: UnicodeDataFile, parse: (String) -> Void) {
        for string in dataFile.strings {
            
            if string.isEmpty == false && string.hasPrefix(commentMarker.description) == false {
                autoreleasepool {
                    parse(string)
                }
            }
            
            processedStringCount += 1
        }
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
    
    static let UnicodeDataFilesDidLoad: NSNotification.Name = .init("KEKbzAcMuOVK4Tn46LFP3loanqNMAB9")
}

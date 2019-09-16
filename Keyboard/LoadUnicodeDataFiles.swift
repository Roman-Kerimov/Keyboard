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
        
        if Keyboard.default.cacheVersion != Bundle.main.version {
            try? FileManager.default.removeItem(at: UnicodeData.default.cacheURL)
            Keyboard.default.cacheVersion = Bundle.main.version
        }
        
        for dataFile in UnicodeDataFile.allCases {
            
            guard !isCancelled else {
                return
            }
            
            switch dataFile {
                
            case .derivedName:
                parse(dataFile: dataFile, output: &UnicodeData.default.codePointNames) { (string, codePointNames) in
                    
                    let components = string.split(separator: columnSeparator).map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    guard components.count == 2 else {
                        return
                    }
                    
                    guard let codePoint = components.first?.hexToUInt32 else {
                        return
                    }
                    
                    codePointNames[codePoint] = components.last!
                }
                
            case .emojiTest:
                parse(dataFile: dataFile, output: &UnicodeData.default.sequenceItems) { (string, sequenceItems) in
                    
                    let components = string.split(maxSplits: 2, omittingEmptySubsequences: false) { [columnSeparator, commentMarker].contains($0) } .map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    let unicodeScalars = components[0].components(separatedBy: .whitespaces).map {$0.hexToUnicodeScalar!}
                    let sequence: String = unicodeScalars.map {$0.description} .reduce(.init(), +)
                    let isFullyQualified: Bool = components[1] == "fully-qualified"
                    let name: String = components[2].drop {$0 != .space} .description.trimmingCharacters(in: .whitespaces)
                    
                    sequenceItems[sequence] = UnicodeItem.init(codePoints: sequence, name: name, isFullyQualified: isFullyQualified)
                }
                
                CharacterSet.emoji = CharacterSet.init(charactersIn: UnicodeData.default.sequenceItems.keys.filter {$0.unicodeScalars.count == 1} .joined())
            }
        }
        
        NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
    }
    
    private func parse<Type: Codable>(dataFile: UnicodeDataFile, output: inout Type, parse: (String, inout Type) -> Void) {
        
        if let outputObject = try? PropertyListDecoder.init().decode(Type.self, from: (try? Data.init(contentsOf: dataFile.cacheURL)) ?? .init()) {
            output = outputObject
            
            processedStringCount += dataFile.strings.count
        }
        else {
            for string in dataFile.strings {
                
                if string.isEmpty == false && string.hasPrefix(commentMarker.description) == false {
                    autoreleasepool {
                        parse(string, &output)
                    }
                }
                
                processedStringCount += 1
            }
            
            if let data = try? PropertyListEncoder.init().encode(output) {
                try! data.write(to: dataFile.cacheURL)
            }
        }
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
    
    static let UnicodeDataFilesDidLoad: NSNotification.Name = .init("KEKbzAcMuOVK4Tn46LFP3loanqNMAB9")
}

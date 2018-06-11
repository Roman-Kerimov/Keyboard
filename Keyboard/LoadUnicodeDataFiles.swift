//
//  LoadUnicodeDataFiles.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    let columnSeparator: String = ";"
    let commentMarker: String = "#"
    
    override func main() {
        
        var processedStringCount = 0
        
        for dataFile in UnicodeDataFile.allCases {
            
            guard !isCancelled else {
                return
            }
            
            switch dataFile {
                
            case .derivedName:
                parse(dataFile: dataFile, processedStringCount: &processedStringCount, output: &UnicodeTable.default.codePointNames) { (string, codePointNames) in
                    
                    let components = string.components(separatedBy: columnSeparator).map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    guard components.count == 2 else {
                        return
                    }
                    
                    guard let codePoint = components.first?.hexToUInt32 else {
                        return
                    }
                    
                    codePointNames[codePoint] = components.last!
                }
                
            case .emojiTest:
                parse(dataFile: dataFile, processedStringCount: &processedStringCount, output: &UnicodeTable.default.sequenceItems) { (string, sequenceItems) in
                    
                    let components = string.components(separatedBy: columnSeparator).flatMap {$0.components(separatedBy: commentMarker + .space)}.map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    let unicodeScalars = components[0].components(separatedBy: .whitespaces).map {$0.hexToUnicodeScalar!}
                    let sequence: String = unicodeScalars.map {$0.description} .reduce(.init(), +)
                    let isFullyQualified: Bool = components[1] == "fully-qualified"
                    let name: String = components[2].drop {$0 != .space} .description.trimmingCharacters(in: .whitespaces)
                    
                    sequenceItems[sequence] = UnicodeItem.init(codePoints: sequence, name: name, isFullyQualified: isFullyQualified)
                }
                
                CharacterSet.emoji = CharacterSet.init(charactersIn: UnicodeTable.default.sequenceItems.keys.filter {$0.unicodeScalars.count == 1} .joined())
            }
        }
        
        NotificationCenter.default.post(name: .UnicodeDataFilesDidLoad, object: nil)
    }
    
    private func parse<Type>(dataFile: UnicodeDataFile, processedStringCount: inout Int, output: inout Type, parse: (String, inout Type) -> Void) {
        
        func updateProgress() {
            let progress: Float = .init(processedStringCount) / .init(UnicodeDataFile.totalStringCount)
            NotificationCenter.default.post(name: .UnicodeDataFilesLoadingProgressDidChange, object: progress)
        }
        
        if let outputObject = NSKeyedUnarchiver.unarchiveObject(withFile: dataFile.cacheURL.path) as? Type {
            output = outputObject
            
            processedStringCount += dataFile.strings.count
            updateProgress()
        }
        else {
            for string in dataFile.strings {
                
                if string.isEmpty == false && string.hasPrefix(commentMarker) == false {
                    autoreleasepool {
                        parse(string, &output)
                    }
                }
                
                processedStringCount += 1
                updateProgress()
            }
            
            NSKeyedArchiver.archiveRootObject(output, toFile: dataFile.cacheURL.path)
        }
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
    
    static let UnicodeDataFilesDidLoad: NSNotification.Name = .init("KEKbzAcMuOVK4Tn46LFP3loanqNMAB9")
}

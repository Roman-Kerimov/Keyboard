//
//  LoadUnicodeDataFiles.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-19.
//

import Foundation

class LoadUnicodeDataFiles: Operation {
    
    override func main() {
        
        var processedStringCount = 0
        
        for dataFile in UnicodeDataFile.cases {
            
            guard !isCancelled else {
                return
            }
            
            switch dataFile {
                
            case .derivedName:
                parse(dataFile: dataFile, processedStringCount: &processedStringCount, output: &UnicodeTable.default.codePointNames) { (string, codePointNames) in
                    
                    let elements = string.split(separator: .semicolon).map {$0.trimmingCharacters(in: .whitespaces)}
                    
                    guard elements.count == 2 else {
                        return
                    }
                    
                    var codePoint: UInt32 = 0
                    guard Scanner.init(string: elements.first!).scanHexInt32(&codePoint) else {
                        return
                    }
                    
                    codePointNames[codePoint] = elements.last!
                }
            }
        }
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
               
                parse(string, &output)
                
                processedStringCount += 1
                updateProgress()
            }
            
            NSKeyedArchiver.archiveRootObject(output, toFile: dataFile.cacheURL.path)
        }
    }
}

extension NSNotification.Name {
    static let UnicodeDataFilesLoadingProgressDidChange: NSNotification.Name = .init("yyYaw81H3txGoDVoLuMIcxI9qcD2ZIb")
}

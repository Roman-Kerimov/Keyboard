//
//  UnicodeTable.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import Foundation

class UnicodeTable: NSObject {
    
    public static let `default`: UnicodeTable = .init()
    
    internal var codePointNames: [UInt32: String] = .init()
    internal var sequenceItems: [String: UnicodeItem] = .init()
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    private override init() {
        super.init()
        
        backgroudOperationQueue.addOperation( LoadUnicodeDataFiles.init() )
    }

    internal var textForSearch: String = .init() {
        didSet {
            
            if oldValue == "" && textForSearch == "" {
                return
            }
            
            frequentlyUsedCharacters = Keyboard.default.frequentlyUsedCharacters
        }
    }
    
    internal var scriptCodeLength: Int = 0
    
    internal var frequentlyUsedCharacters: [Character] = Keyboard.default.frequentlyUsedCharacters
    
    public func searchScalars(byName text: String) {
        if let searchUnicodeScalarsOperation = backgroudOperationQueue.operations.last as? SearchUnicodeScalars {
            searchUnicodeScalarsOperation.cancel()
        }
        
        textForSearch = text
        
        backgroudOperationQueue.addOperation( SearchUnicodeScalars.init() )
    }
    
    var cacheURL: URL {
        let cacheDirectoryURL = URL.applicationSupport.appendingPathComponent("UDFCache")
        var isDirectory: ObjCBool = false
        FileManager.default.fileExists(atPath: cacheDirectoryURL.path, isDirectory: &isDirectory)
        
        if !isDirectory.boolValue {
            try? FileManager.default.removeItem(at: cacheDirectoryURL)
            try! FileManager.default.createDirectory(atPath: cacheDirectoryURL.path, withIntermediateDirectories: false, attributes: nil)
        }
        
        return cacheDirectoryURL
    }
}

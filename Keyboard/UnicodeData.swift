//
//  UnicodeData.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import Foundation

class UnicodeData: NSObject {
    
    public static let `default`: UnicodeData = .init()
    
    internal var codePointNames: [UInt32: String] = .init()
    internal var sequenceItems: [String: UnicodeItem] = .init()
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    private override init() {
        super.init()
        
        backgroudOperationQueue.addOperation( LoadUnicodeDataFiles.init() )
    }
    
    func loadIfNeeded() {}
    
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

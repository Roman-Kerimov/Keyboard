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
    
    var items: [UnicodeItem] = []
    
    func item(byCodePoints codePoints: String) -> UnicodeItem? {
        return items.last(where: {$0.codePoints == codePoints && $0.codePoints.unicodeScalars.map {$0.value} == codePoints.unicodeScalars.map {$0.value} })
    }
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    func waitUntilLoadingIsFinished() {
        backgroudOperationQueue.waitUntilAllOperationsAreFinished()
    }
    
    private override init() {
        super.init()
        
        backgroudOperationQueue.addOperation( LoadUnicodeDataFiles.init() )
    }
    
    func loadIfNeeded() {}
    
    var cacheURL: URL {
        let cacheURL = URL.applicationSupport.appendingPathComponent("UDFCache")
        var isDirectory: ObjCBool = false
        FileManager.default.fileExists(atPath: cacheURL.path, isDirectory: &isDirectory)
        
        if isDirectory.boolValue {
            try? FileManager.default.removeItem(at: cacheURL)
        }
        
        return cacheURL
    }
}

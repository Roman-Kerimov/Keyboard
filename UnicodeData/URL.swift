//
//  URL.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-21.
//

import Foundation

extension URL {
    static var applicationSupport: URL {
        var applicationSupportURL: URL = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        #if os(macOS)
        applicationSupportURL.appendPathComponent(Bundle.main.bundleIdentifier!)
        try! FileManager.default.createDirectory(at: applicationSupportURL, withIntermediateDirectories: true, attributes: nil)
        #endif
        
        return applicationSupportURL
    }
    
    var attributes: [FileAttributeKey: Any]? {
        return try? FileManager.default.attributesOfItem(atPath: self.path)
    }
    
    var creationDate: Date? {
        return attributes?[.creationDate] as? Date
    }
}

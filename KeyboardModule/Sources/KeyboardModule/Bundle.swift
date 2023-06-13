//
//  Bundle.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-02-07.
//

import Foundation

public extension Bundle {
    
    var isExtension: Bool {
        bundlePath.hasSuffix(".appex")
    }
    
    var productName: String {
        infoDictionary?[kCFBundleNameKey as String] as? String ?? ""
    }
    
    var version: String {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        return "\(versionNumber) (\(buildNumber))"
    }
}

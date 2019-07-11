//
//  Bundle.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-02-07.
//

import Foundation

extension Bundle {
    static let main: Bundle = .init(for: MainBundle.self)
    
    var isExtension: Bool {
        return bundlePath.hasSuffix(".appex")
    }
    
    var productName: String {
        return infoDictionary?[kCFBundleNameKey as String] as? String ?? .init()
    }
    
    var version: String {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        return "\(versionNumber) (\(buildNumber))"
    }
}

class MainBundle {}

//
//  Bundle.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-02-07.
//

import Foundation
import CommonCrypto

extension Bundle {
    
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
    
    var cacheVersion: String {
        return executableHash
    }
    
    var executableHash: String {
        let data = try! Data.init(contentsOf: executableURL!)
        
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        
        return Data(hash).base64EncodedString()
    }
}

class MainBundle {}

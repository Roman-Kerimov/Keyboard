//
//  Bundle.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-02-07.
//

import Foundation
import CommonCrypto

extension Bundle {
    var executableHash: String {
        let data = try! Data(contentsOf: executableURL!)
        
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        
        return Data(hash).base64EncodedString()
    }
}

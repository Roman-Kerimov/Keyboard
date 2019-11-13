//
//  legalNotices.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import Foundation

let legalNotices =
    
"""
Acknowledgments:

Portions of this software may utilize the following copyrighted material, the use of which is hereby acknowledged.


\(try! String(contentsOf: Bundle.main.url(forResource: "unicode-license", withExtension: "txt")!))
"""

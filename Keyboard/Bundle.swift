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
}

class MainBundle {}
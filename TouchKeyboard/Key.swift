//
//  Key.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-12.
//

import Foundation

class Key: NSObject {
    let label: String
    let shiftDownLabel: String
    let shiftUpLabel: String
    let shiftRightLabel: String
    let shiftLeftLabel: String
    
    init(label: String,
         shiftDownLabel: String = .init(),
         shiftUpLabel: String = .init(),
         shiftRightLabel: String = .init(),
         shiftLeftLabel: String = .init()
        ) {
        
        self.label = label
        self.shiftDownLabel = shiftDownLabel
        self.shiftUpLabel = shiftUpLabel
        self.shiftLeftLabel = shiftLeftLabel
        self.shiftRightLabel = shiftRightLabel
    }
    
    static let delete: Key = .init(label:"delete")
    static let space: Key = .init(label: " ", shiftUpLabel: "_", shiftRightLabel: "insist")
    static let `return`: Key = .init(label:"return")
    static let tab: Key = .init(label:"tab")
    static let nextKeyboard: Key = .init(label:"NextKeyboard")
    static let dismissKeyboard: Key = .init(label:"HideKeyboard")
    static let settings: Key = .init(label:"Settings")
}

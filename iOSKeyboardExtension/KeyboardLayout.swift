//
//  KeyboardLayout.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 08.11.16.
//
//

import UIKit

class KeyboardLayout {
    
    private let layout: [[String]]
    
    var left: [[String]] {
        return layout.map { Array($0.dropLast($0.count - leftHorizontalKeyCount)) }
    }
    
    var right: [[String]] {
        return layout.map { Array($0.dropFirst(leftHorizontalKeyCount)) }
    }
    
    init(_ labels: [[String]]) {
        layout = labels
        
    }
    
    var horizontalKeyCount: Int {
        return layout.map { $0.count }.max()!
    }
    
    var leftHorizontalKeyCount: Int {
        return horizontalKeyCount / 2
    }
    
    var rightHorizontalKeyCount: Int {
        return horizontalKeyCount - leftHorizontalKeyCount
    }

    static let qwerty = KeyboardLayout(
        [
            [	"q",	"w",	"e",	"r",	"t",	"y",	"u",	"i",	"o",	"p",	],
            [	"a",	"s",	"d",	"f",	"g",	"h",	"j",	"k",	"l",	"",	],
            [	"z",	"x",	"c",	"v",	"b",	"n",	"m",	",",	".",	"",	]
        ]	
    )
    
    static let dvorak = KeyboardLayout(
        [
            [	"'",	",",	".",	"p",	"y",	"f",	"g",	"c",	"r",	"l",	],
            [	"a",	"o",	"e",	"u",	"i",	"d",	"h",	"t",	"n",	"s",	],
            [	";",	"q",	"j",	"k",	"x",	"b",	"m",	"w",	"v",	"z",	]
        ]	
    )
}

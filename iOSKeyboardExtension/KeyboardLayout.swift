//
//  KeyboardLayout.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 08.11.16.
//
//

import UIKit

class KeyboardLayout {
    
    let labels: [[String]]
    
    init(_ labels: [[String]]) {
        self.labels = labels
    }
    
    var rowCount: Int {
        return labels.count
    }
    
    var columnCount: Int {
        return labels.map { $0.count }.max()!
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

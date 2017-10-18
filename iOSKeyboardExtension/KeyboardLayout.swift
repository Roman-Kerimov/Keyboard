//
//  KeyboardLayout.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 08.11.16.
//
//

import UIKit

struct KeyboardLayout {
    
    let name: String
    
    let rows: [[String]]
    
    var rowCount: Int {
        return rows.count
    }
    
    var columnCount: Int {
        return rows.map { $0.count }.max()!
    }
    
    static let list: [KeyboardLayout] = [.qwerty, .dvorak]

    static let qwerty = KeyboardLayout(
        name: "QWERTY",
        rows: [
            [	"q",	"w",	"e",	"r",	"t",	"y",	"u",	"i",	"o",	"p",	],
            [	"a",	"s",	"d",	"f",	"g",	"h",	"j",	"k",	"l",	"'",	],
            [	"z",	"x",	"c",	"v",	"b",	"n",	"m",	",",	".",	"?",	]
        ]	
    )
    
    static let shiftUpDictionary: [String: String] = [
        ".": ":",
        ",": ";",
        "?": "!",
        "'": "\"",
        SpecialKey.space.label: "_"
    ]
    
    static let shiftDown = KeyboardLayout(
        name: "ShiftDown",
        rows: [
            [	"&",	"<",	">",	"|",	"{}",	"/",	"7",	"8",	"9",	"-",	],
            [	"@",	"#",	"$",	"%",	"()",	"*",	"4",	"5",	"6",	"+",	],
            [	"`",	"~",	"^",	"\\",	"[]",	"0",	"1",	"2",	"3",	"=",	]
        ]	
    )
    
    static let dvorak = KeyboardLayout(
        name: "Dvorak",
        rows: [
            [	"'",	",",	".",	"p",	"y",	"f",	"g",	"c",	"r",	"l",	],
            [	"a",	"o",	"e",	"u",	"i",	"d",	"h",	"t",	"n",	"s",	],
            [	"?",	"q",	"j",	"k",	"x",	"b",	"m",	"w",	"v",	"z",	]
        ]	
    )
}

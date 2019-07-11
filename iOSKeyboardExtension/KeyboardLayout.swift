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
    
    let labels: [[String]]
    
    var rowCount: Int {
        return labels.count
    }
    
    var columnCount: Int {
        return labels.map { $0.count }.max()!
    }
    
    static let list: [KeyboardLayout] = [.qwerty, .dvorak]

    static let qwerty = KeyboardLayout(
        name: "QWERTY",
        labels: [
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
        labels: [
            [	"&",	"<",	">",	"|",	"{}",	"/",	"7",	"8",	"9",	"-",	],
            [	"@",	"#",	"$",	"%",	"()",	"*",	"4",	"5",	"6",	"+",	],
            [	"`",	"~",	"^",	"\\",	"[]",	"0",	"1",	"2",	"3",	"=",	]
        ]	
    )
    
    static let unionDictionary: [String: String] = [
        "`": String(Character(UnicodeScalar(0x300)!)),
        "'": String(Character(UnicodeScalar(0x301)!)),
        "^": String(Character(UnicodeScalar(0x302)!)),
        "~": String(Character(UnicodeScalar(0x303)!)),
        "-": String(Character(UnicodeScalar(0x304)!)),
        "--": String(Character(UnicodeScalar(0x305)!)),
        "u": String(Character(UnicodeScalar(0x306)!)),
        ".": String(Character(UnicodeScalar(0x307)!)),
        "..": String(Character(UnicodeScalar(0x308)!)),
        "\"": String(Character(UnicodeScalar(0x30B)!)),
        "\'\'": String(Character(UnicodeScalar(0x30B)!)),
        "v": String(Character(UnicodeScalar(0x30C)!)),
        "``": String(Character(UnicodeScalar(0x30F)!)),
        
        "c$": "¢",
        "L$": "£",
        "Y$": "¥",
        "C$": "₡",
        "Cr$": "₢",
        "F$": "₣",
        "m$": "₥",
        "N$": "₦",
        "Pts$": "₧",
        "Rs$": "₨",
        "W$": "₩",
        "sh$": "₪",
        "d$": "₫",
        "E$": "€",
        "K$": "₭",
        "Tu$": "₮",
        "Dr$": "₯",
        "Pf$": "₰",
        "P$": "₱",
        "G$": "₲",
        "A$": "₳",
        "H$": "₴",
        "Ce$": "₵",
        "lt$": "₶",
        "Te$": "₸",
        "Rup$": "₹",
        "TL$": "₺",
        "man$": "₼",
        "R$": "₽",
        "La$": "₾",
        "B$": "₿",
        
        "N#": "№",
    ]
    
    static let dvorak = KeyboardLayout(
        name: "Dvorak",
        labels: [
            [	"'",	",",	".",	"p",	"y",	"f",	"g",	"c",	"r",	"l",	],
            [	"a",	"o",	"e",	"u",	"i",	"d",	"h",	"t",	"n",	"s",	],
            [	"?",	"q",	"j",	"k",	"x",	"b",	"m",	"w",	"v",	"z",	]
        ]	
    )
}

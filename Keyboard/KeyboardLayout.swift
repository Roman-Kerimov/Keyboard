//
//  KeyboardLayout.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-11-08.
//
//

import Foundation

struct KeyboardLayout {
    
    let name: String
    
    let rows: [[Key]]
    
    func key(code: Keycode) -> Key? {
        return keycodeToKeyDictionary[code]
    }
    
    private var keycodeToKeyDictionary: [Keycode: Key] = [
        .space: .space,
        .enter: .enter,
    ]
    
    var rowCount: Int {
        return rows.count
    }
    
    var columnCount: Int {
        return rows.map { $0.count }.max()!
    }
    
    static let list: [KeyboardLayout] = [.qwerty, .dvorak, .colemak, .azerty, .qwertz]
    
    init(name: String, rows: [[CharacterComponent]]) {
        self.name = name
        
        let shiftDownRows: [[CharacterComponent]] = [
            [ .caret,        .tilde,       .asterisk,     .apostrophe,   .curlyBracket,  .divisionSign,       .seven, .eight, .nine,  .minusSign,  ],
            [ .commercialAt, .numberSign,  .ampersand,    .verticalLine, .parenthesis,   .multiplicationSign, .four,  .five,  .six,   .plusSign,   ],
            [ .dollarSign,   .percentSign, .lessThanSign, .solidus,      .squareBracket, .zero,               .one,   .two,   .three, .equalsSign, ],
        ]
        
        let keycodeRows: [[Keycode]] = [
            [ .q, .w, .e, .r, .t, .y, .u, .i,     .o,        .p,         ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .semicolon, ],
            [ .z, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .solidus,   ],
        ]
        
        var keyRows: [[Key]] = []
        for ((row, shiftDownRow), keycodeRow) in zip(zip(rows, shiftDownRows), keycodeRows) {
            var keyRow: [Key] = []
            for ((label, shiftDownCharacterComponent), keycode) in zip(zip(row, shiftDownRow), keycodeRow) {
                let shiftUpLabel: String
                
                if let shiftUpComponent = KeyboardLayout.shiftUpDictionary[label] {
                    shiftUpLabel = [shiftUpComponent].character
                }
                else {
                    shiftUpLabel = .init()
                }
                
                let shiftDownLabel = [shiftDownCharacterComponent].character + [shiftDownCharacterComponent].extraArray.filter {$0.contains(.extra0) || $0.contains(.extra1) || $0.contains(.extra2)} .map {$0.character} .joined()
                
                let key: Key = Key.init(label: [label].character, shiftDownLabel: shiftDownLabel, shiftUpLabel: shiftUpLabel)
                keyRow.append(key)
                keycodeToKeyDictionary[keycode] = key
            }
            
            keyRows.append(keyRow)
        }
        
        self.rows = keyRows
    }

    static let qwerty = KeyboardLayout(
        name: "QWERTY",
        rows: [
            [ .q, .w, .e, .r, .t, .y, .u, .i,     .o,        .p,            ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .questionMark, ],
            [ .z, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .hyphen,       ],
        ]
    )
    
    static let dvorak = KeyboardLayout(
        name: "Dvorak",
        rows: [
            [ .hyphen,       .comma, .fullStop, .p, .y, .f, .g, .c, .r, .l, ],
            [ .a,            .o,     .e,        .u, .i, .d, .h, .t, .n, .s, ],
            [ .questionMark, .q,     .j,        .k, .x, .b, .m, .w, .v, .z, ],
        ]
    )
    
    static let colemak = KeyboardLayout(
        name: "Colemak",
        rows: [
            [ .q, .w, .f, .p, .g, .j, .l, .u,     .y,        .hyphen,       ],
            [ .a, .r, .s, .t, .d, .h, .n, .e,     .i,        .o,            ],
            [ .z, .x, .c, .v, .b, .k, .m, .comma, .fullStop, .questionMark, ],
        ]
    )
    
    static let azerty = KeyboardLayout(
        name: "AZERTY",
        rows: [
            [ .a, .z, .e, .r, .t, .y, .u,     .i,        .o,            .p,      ],
            [ .q, .s, .d, .f, .g, .h, .j,     .k,        .l,            .m,      ],
            [ .w, .x, .c, .v, .b, .n, .comma, .fullStop, .questionMark, .hyphen, ],
        ]
    )
    
    static let qwertz = KeyboardLayout(
        name: "QWERTZ",
        rows: [
            [ .q, .w, .e, .r, .t, .z, .u, .i,     .o,        .p,            ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .questionMark, ],
            [ .y, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .hyphen,       ],
        ]
    )
    
    static let shiftUpDictionary: [CharacterComponent: CharacterComponent] = [
        .fullStop: .colon,
        .comma: .semicolon,
        .questionMark: .exclamationMark,
        .apostrophe: .quotationMark,
        .space: .lowLine,
    ]
    
    static let shiftRightDictionary: [CharacterComponent: CharacterComponent] = [.lessThanSign: .greaterThanSign]
}

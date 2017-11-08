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
    
    let rows: [[CharacterComponent]]
    
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
            [ .q, .w, .e, .r, .t, .y, .u, .i,     .o,        .p,            ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .apostrophe,   ],
            [ .z, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .questionMark, ],
        ]
    )
    
    static let dvorak = KeyboardLayout(
        name: "Dvorak",
        rows: [
            [ .apostrophe,   .comma, .fullStop, .p, .y, .f, .g, .c, .r, .l, ],
            [ .a,            .o,     .e,        .u, .i, .d, .h, .t, .n, .s, ],
            [ .questionMark, .q,     .j,        .k, .x, .b, .m, .w, .v, .z, ],
        ]
    )
    
    static let shiftUpDictionary: [CharacterComponent: CharacterComponent] = [
        .fullStop: .colon,
        .comma: .semicolon,
        .questionMark: .exclamationMark,
        .apostrophe: .quotationMark,
        .space: .lowLine,
    ]
    
    static let shiftDown = KeyboardLayout(
        name: "ShiftDown",
        rows: [
            [ .ampersand,    .lessThanSign, .greaterThanSign, .verticalLine, .curlyBracket,  .solidus,  .seven, .eight, .nine,  .hyphenMinus, ],
            [ .commercialAt, .numberSign,   .dollarSign,      .percentSign,  .parenthesis,   .asterisk, .four,  .five,  .six,   .plusSign,    ],
            [ .graveAccent,  .tilde,        .caret,           .solidus,      .squareBracket, .zero,     .one,   .two,   .three, .equalsSign,  ],
        ]
    )
}

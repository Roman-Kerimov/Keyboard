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
    
    let inputSourceID: String
    
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
    
    let components: Set<CharacterComponent>
    
    static let list: [KeyboardLayout] = [.qwerty, .dvorak, .colemak, .azerty, .qwertz]
    
    init(name: String, rows: [[CharacterComponent]], defaultInputSourceID: String) {
        self.name = name
        
        let shiftDownRows: [[CharacterComponent]] = [
            [ .asterisk,     .apostrophe,    .ampersand,       .verticalLine, .tilde,   .divisionSign,       .seven, .eight, .nine,  .minusSign,  ],
            [ .commercialAt, .numberSign,    .dollarSign,      .percentSign,  .caret,   .multiplicationSign, .four,  .five,  .six,   .plusSign,   ],
            [ .curlyBracket, .squareBracket, .leftParenthesis, .lessThanSign, .solidus, .zero,               .one,   .two,   .three, .equalsSign, ],
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
        self.inputSourceID = defaultInputSourceID
        
        components = Set.init(.init(rows.joined()) + .init(shiftDownRows.joined()) + KeyboardLayout.shiftUpDictionary.values + [.space])
    }

    static let qwerty = KeyboardLayout(
        name: "QWERTY",
        rows: [
            [ .q, .w, .e, .r, .t, .y, .u, .i,     .o,        .p,            ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .questionMark, ],
            [ .z, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .hyphen,       ],
        ],
        defaultInputSourceID: "com.apple.keylayout.ABC"
    )
    
    static let dvorak = KeyboardLayout(
        name: "Dvorak",
        rows: [
            [ .questionMark, .comma, .fullStop, .p, .y, .f, .g, .c, .r, .l, ],
            [ .a,            .o,     .e,        .u, .i, .d, .h, .t, .n, .s, ],
            [ .hyphen,       .q,     .j,        .k, .x, .b, .m, .w, .v, .z, ],
        ],
        defaultInputSourceID: "com.apple.keylayout.DVORAK-QWERTYCMD"
    )
    
    static let colemak = KeyboardLayout(
        name: "Colemak",
        rows: [
            [ .q, .w, .f, .p, .g, .j, .l, .u,     .y,        .hyphen,       ],
            [ .a, .r, .s, .t, .d, .h, .n, .e,     .i,        .o,            ],
            [ .z, .x, .c, .v, .b, .k, .m, .comma, .fullStop, .questionMark, ],
        ],
        defaultInputSourceID: "com.apple.keylayout.Colemak"
    )
    
    static let azerty = KeyboardLayout(
        name: "AZERTY",
        rows: [
            [ .a, .z, .e, .r, .t, .y, .u,     .i,        .o,            .p,      ],
            [ .q, .s, .d, .f, .g, .h, .j,     .k,        .l,            .m,      ],
            [ .w, .x, .c, .v, .b, .n, .comma, .fullStop, .questionMark, .hyphen, ],
        ],
        defaultInputSourceID: "com.apple.keylayout.ABC-AZERTY"
    )
    
    static let qwertz = KeyboardLayout(
        name: "QWERTZ",
        rows: [
            [ .q, .w, .e, .r, .t, .z, .u, .i,     .o,        .p,            ],
            [ .a, .s, .d, .f, .g, .h, .j, .k,     .l,        .questionMark, ],
            [ .y, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .hyphen,       ],
        ],
        defaultInputSourceID: "com.apple.keylayout.ABC-QWERTZ"
    )
    
    static let shiftUpDictionary: [CharacterComponent: CharacterComponent] = [
        .fullStop: .colon,
        .comma: .semicolon,
        .questionMark: .exclamationMark,
        .apostrophe: .quotationMark,
        .hyphen: .lowLine,
    ]
    
    static let shiftRightDictionary: [CharacterComponent: CharacterComponent] = [
        .lessThanSign: .greaterThanSign,
        .leftParenthesis: .rightParenthesis,
    ]
    
    static let reversedShiftRightDictionary = Dictionary.init(uniqueKeysWithValues: shiftRightDictionary.map {($1, $0)})
}

extension Array where Element == KeyboardLayout {
    func element(inputSourceID: String) -> Element? {
        
        guard let index = self.map( {$0.inputSourceID} ).firstIndex(of: inputSourceID) else {
            return nil
        }
        
        return self[index]
    }
}

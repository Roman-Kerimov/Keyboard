//
//  KeyboardLayout.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-11-08.
//
//

import Foundation

struct KeyboardLayout: Equatable {
    
    let name: String
    let inputSourceID: String
    
    private var characterComponents: [CharacterComponent] = .init(repeating: .none, count: Keycode.keycodeMaxCount)
    
    func characterComponent(fromKeycode keycode: Keycode) -> CharacterComponent {characterComponents[.init(keycode)]}
    
    func contain(_ key: Key) -> Bool {characterComponents[Int(key.keycode)] != .none || key == .enter}
    
    var components: Set<CharacterComponent> {
        .init(characterComponents + KeyboardLayout.option.characterComponents + KeyboardLayout.shiftUpDictionary.values + [.space])
    }
    
    static let list: [KeyboardLayout] = [.qwerty, .dvorak, .colemak, .azerty, .qwertz]
    
    private init(name: String = "", rows: [[CharacterComponent]] = .init(repeating: .init(repeating: .zero, count: Key.layoutBoardColumnCount), count: Key.layoutBoardRowCount), defaultInputSourceID: String = "") {
        self.name = name
        
        for (characterComponentRow, keyRow) in zip(rows, Key.layoutBoard) {
            for (characterComponent, key) in zip(characterComponentRow, keyRow) {
                characterComponents[Int.init(key.keycode)] = characterComponent
            }
        }
        
        characterComponents[Int.init(Key.space.keycode)] = .space
        
        self.inputSourceID = defaultInputSourceID
    }
    
    static let system = KeyboardLayout(
        name: "System"
    )
    
    static let option = KeyboardLayout(
        rows: [
            [ .asterisk,     .apostrophe,    .ampersand,       .verticalLine, .tilde,   .divisionSign,       .seven, .eight, .nine,  .minusSign,  ],
            [ .commercialAt, .numberSign,    .dollarSign,      .percentSign,  .caret,   .multiplicationSign, .four,  .five,  .six,   .plusSign,   ],
            [ .curlyBracket, .squareBracket, .leftParenthesis, .lessThanSign, .solidus, .zero,               .one,   .two,   .three, .equalsSign, ],
        ]
    )

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
    func element(inputSourceID: String) -> Element {
        
        guard let index = self.map( {$0.inputSourceID} ).firstIndex(of: inputSourceID) else {
            return .system
        }
        
        return self[index]
    }
}

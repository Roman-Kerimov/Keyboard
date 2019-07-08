//
//  Key.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-01-12.
//

import Foundation

final class Key {
    
    let keycode: Keycode
    
    private init(keycode: Keycode) {
        self.keycode = keycode
    }
    
    private static let keys: [Key] = (0..<Keycode.keycodeMaxCount).map {Key.init(keycode: .init($0))}
    
    static func by(keycode: Keycode) -> Key {keys[Int(keycode)]}
    
    static let keysByLabel: [String: Key] = .init(uniqueKeysWithValues: keys.filter {!$0.label.isEmpty} .map {($0.label, $0)})
    
    static func by(labelCharacter: Character) -> Key? {
        guard let key = keysByLabel[labelCharacter.description] else {
            return nil
        }
        
        return key
    }
    
    static let keysByShiftUpLabel: [String: Key] = .init(uniqueKeysWithValues: keys.filter {!$0.shiftUpLabel.isEmpty} .map {($0.shiftUpLabel, $0)})
    
    static func by(shiftUpLabelCharacter: Character) -> Key? {
        guard let key = keysByShiftUpLabel[shiftUpLabelCharacter.description] else {
            return nil
        }
        
        return key
    }
    
    static let keysByShiftDownLabel: [String: Key] = .init(uniqueKeysWithValues: keys.filter {!$0.shiftDownLabel.isEmpty} .map {($0.shiftDownLabel.first!.description, $0)})
    
    static func by(shiftDownLabelCharacter: Character) -> Key? {
        guard let key = keysByShiftDownLabel[shiftDownLabelCharacter.description] else {
            return nil
        }
        
        return key
    }
    
    private var mainComponent: CharacterComponent {
        return Keyboard.default.layout.characterComponent(fromKeycode: keycode)
    }
    
    var label: String {
        
        #if os(macOS)
        if Keyboard.default.layout == .system {
            return keycode.label(flags: [])
        }
        #endif
        
        switch self {
        case .delete:
            return "delete"
        case .enter:
            return "enter"
        case .nextKeyboard:
            return "NextKeyboard"
        case .dismissKeyboard:
            return "HideKeyboard"
        case .settings:
            return "Settings"
        default:
            return [mainComponent].character
        }
    }
    
    var shiftDownLabel: String {
        
        let shiftDownCharacterComponent = KeyboardLayout.option.characterComponent(fromKeycode: keycode)
        
        return [shiftDownCharacterComponent].character + [shiftDownCharacterComponent].extraArray.filter {$0.contains(.extra0) || $0.contains(.extra1) || $0.contains(.extra2)} .map {$0.character} .joined()
    }
    
    var shiftUpLabel: String {
        if let shiftUpComponent = KeyboardLayout.shiftUpDictionary[mainComponent] {
            return [shiftUpComponent].character
        }
        else {
            return .init()
        }
    }
    
    var shiftRightLabel: String {
        return self == .space ? .tab : ""
    }
    
    var shiftLeftLabel: String {
        return self == .space && Keyboard.default.delegate?.needsReturn != false ? .return : ""
    }
}

// MARK: -  Equatable
extension Key: Equatable {
    static func == (lhs: Key, rhs: Key) -> Bool {
        lhs.keycode == rhs.keycode
    }
}

// MARK: - Keys
extension Key {
    
    static let board: [[Key]] = [
        [.esc, .f1, .f2, .f3, .f4, .f5, .f6, .f7, .f8, .f9, .f10, .f11, .f12],
        [.grave, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .hyphenMinus, .equal, .delete],
        [.tab, .q, .w, .e, .r, .t, .y, .u, .i, .o, .p, .leftSquareBracket, .rightSquareBracket, .reverseSolidus],
        [.capsLock, .a, .s, .d, .f, .g, .h, .j, .k, .l, .semicolon, .apostrophe, .enter],
        [.leftShift, .z, .x, .c, .v, .b, .n, .m, .comma, .fullStop, .solidus, .rightShift],
        [.fn, .leftControl, .leftOption, .leftCommand, .space, .rightCommand, .rightOption],
        [.upArrow, .leftArrow, .downArrow, .rightArrow]
    ]
    
    static let layoutBoard: [[Key]] = board.dropFirst(2).prefix(3).map {.init($0.dropFirst(1).prefix(10))}
    static let layoutBoardRowCount = layoutBoard.count
    static let layoutBoardColumnCount = layoutBoard.first!.count
    
    static let esc: Key = keys[53]
    static let f1: Key = keys[122]
    static let f2: Key = keys[120]
    static let f3: Key = keys[99]
    static let f4: Key = keys[118]
    static let f5: Key = keys[96]
    static let f6: Key = keys[97]
    static let f7: Key = keys[98]
    static let f8: Key = keys[100]
    static let f9: Key = keys[101]
    static let f10: Key = keys[109]
    static let f11: Key = keys[103]
    static let f12: Key = keys[111]
    
    static let grave: Key = keys[50]
    static let one: Key = keys[18]
    static let two: Key = keys[19]
    static let three: Key = keys[20]
    static let four: Key = keys[21]
    static let five: Key = keys[23]
    static let six: Key = keys[22]
    static let seven: Key = keys[26]
    static let eight: Key = keys[28]
    static let nine: Key = keys[25]
    static let zero: Key = keys[29]
    static let hyphenMinus: Key = keys[27]
    static let equal: Key = keys[24]
    static let delete: Key = keys[51]
    
    static let tab: Key = keys[48]
    static let q: Key = keys[12]
    static let w: Key = keys[13]
    static let e: Key = keys[14]
    static let r: Key = keys[15]
    static let t: Key = keys[17]
    static let y: Key = keys[16]
    static let u: Key = keys[32]
    static let i: Key = keys[34]
    static let o: Key = keys[31]
    static let p: Key = keys[35]
    static let leftSquareBracket: Key = keys[33]
    static let rightSquareBracket: Key = keys[30]
    static let reverseSolidus: Key = keys[42]
    
    static let capsLock: Key = keys[57]
    static let a: Key = keys[0]
    static let s: Key = keys[1]
    static let d: Key = keys[2]
    static let f: Key = keys[3]
    static let g: Key = keys[5]
    static let h: Key = keys[4]
    static let j: Key = keys[38]
    static let k: Key = keys[40]
    static let l: Key = keys[37]
    static let semicolon: Key = keys[41]
    static let apostrophe: Key = keys[39]
    static let enter: Key = keys[36]
    
    static let leftShift: Key = keys[56]
    static let z: Key = keys[6]
    static let x: Key = keys[7]
    static let c: Key = keys[8]
    static let v: Key = keys[9]
    static let b: Key = keys[11]
    static let n: Key = keys[45]
    static let m: Key = keys[46]
    static let comma: Key = keys[43]
    static let fullStop: Key = keys[47]
    static let solidus: Key = keys[44]
    static let rightShift: Key = keys[60]
    
    static let fn: Key = keys[63]
    static let leftControl: Key = keys[59]
    static let leftOption: Key = keys[58]
    static let leftCommand: Key = keys[55]
    static let space: Key = keys[49]
    static let rightCommand: Key = keys[54]
    static let rightOption: Key = keys[61]
    
    static let upArrow: Key = keys[126]
    static let leftArrow: Key = keys[123]
    static let downArrow: Key = keys[125]
    static let rightArrow: Key = keys[124]
    
    
    static let forwardDelete: Key = keys[117]
    
    
    
    static let settings = keys[256]
    static let nextKeyboard = keys[257]
    static let dismissKeyboard = keys[258]
}


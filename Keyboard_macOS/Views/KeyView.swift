//
//  KeyView.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-07-12.
//

import SwiftUI
import KeyboardModule

struct KeyView : View {
    @ObservedObject var key: Key
    
    var body: some View {
        ZStack(
            alignment: Key.leftSpecialKeys.contains(key)
            ? .bottomLeading
            : Key.rightSpecialKeys.contains(key) ? .bottomTrailing : .center
        ) {
            
            Rectangle()
                .foregroundColor(.control)
                .cornerRadius(.keyboardGrid(1.5/19))
                .padding(.keyboardGrid(1/19))
            
            Text(key.label)
                .font(
                    Key.specialKeys.contains(key)
                    ? .custom(.specialKeyLabelFont, size: .keyboardGrid(4/19))
                    : .custom(.characterFontName, size: .keyboardGrid(8/19))
                )
                .padding(Key.specialKeys.contains(key) ? .keyboardGrid(2/19) : 0)
        }
        .frame(width: width(for: key), height: .keyboardGrid(Key.arrowKeys.contains(key) ? 0.5 : 1))
        .offset(x: 0, y: key == .upArrow ? .keyboardGrid(-0.5) : 0)
        .padding(.leading, key == .downArrow ? .keyboardGrid(-0.995) : 0)
    }
    
    func width(for key: Key) -> CGFloat {
        switch key {
        case .delete, .tab:
            return .keyboardGrid(1.5)
        case .capsLock, .enter:
            return .keyboardGrid(1.75)
        case .leftShift, .rightShift:
            return .keyboardGrid(2.25)
        case .leftCommand, .rightCommand:
            return .keyboardGrid(1.25)
        case .space:
            return .keyboardGrid(5)
        default:
            return .keyboardGrid(1)
        }
    }
}

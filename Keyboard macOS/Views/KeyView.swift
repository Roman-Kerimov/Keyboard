//
//  KeyView.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-12.
//

import SwiftUI

struct KeyView : View {
    @EnvironmentObject var key: Key
    
    var body: some View {
        ZStack(alignment: Key.leftSpecialKeys.contains(key) ? .bottomLeading : Key.rightSpecialKeys.contains(key) ? .bottomTrailing : .center) {
            
            Rectangle()
                .foregroundColor(.primary)
                .colorInvert()
                .cornerRadius(.keyboardGrid(1.5/19))
                .padding(.keyboardGrid(1/19))
            
            Text(key.label)
                .font(Key.specialKeys.contains(key) ? .custom(.specialKeyLabelFont, size: .keyboardGrid(4/19)) : .custom(.characterFontName, size: .keyboardGrid(8/19)))
                .padding(Key.specialKeys.contains(key) ? .keyboardGrid(2/19) : 0)
        }
        .frame(width: self.width(for: key), height: .keyboardGrid(Key.arrowKeys.contains(key) ? 0.5 : 1))
        .offset(x: 0, y: key == .upArrow ? .keyboardGrid(-0.5) : 0)
        .padding(.leading, key == .downArrow ? .keyboardGrid(-1) : 0)
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

#if DEBUG
struct KeyView_Previews : PreviewProvider {
    static var previews: some View {
        Keyboard.default.delegate?.prepareForPreview()
        
        return KeyView()
            .environmentObject(Key.a)
    }
}
#endif

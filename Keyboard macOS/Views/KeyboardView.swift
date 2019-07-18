//
//  KeyboardView.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-09.
//

import SwiftUI

struct KeyboardView : View {
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(0..<Key.board.count) { rowIndex in
                HStack(alignment: .bottom, spacing: 0) {
                    ForEach(Key.board[rowIndex], id: \.keycode) { key in
                        KeyView()
                            .environmentObject(key)
                    }
                }
            }
        }
        .frame(width: .keyboardGrid(14.5), height: .keyboardGrid(5))
    }
}

#if DEBUG
struct KeyboardView_Previews : PreviewProvider {
    static var previews: some View {
        Keyboard.default.delegate?.prepareForPreview()
        Keyboard.default.previewLayout = .option
        
        return KeyboardView()
            .environmentObject(Keyboard.default)
    }
}
#endif
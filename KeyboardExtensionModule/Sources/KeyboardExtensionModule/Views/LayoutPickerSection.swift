//
//  LayoutPickerSection.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-31.
//

import SwiftUI
import KeyboardModule

@available(iOS 13.0, *)
struct LayoutPickerSection: View {
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View {
        Section(header: Text(KEYBOARD.uppercasedString)) {
            ForEach(KeyboardLayout.allLayouts) { layout in
                Button(action: {self.keyboard.layout = layout}) {
                    HStack {
                        Text(layout.name)
                            .foregroundColor(.primary)
                        
                        Spacer()

                        if layout == self.keyboard.layout {
                            Image.checkmark.foregroundColor(.accentColor)
                        }
                    }
                }
            }
        }
    }
}

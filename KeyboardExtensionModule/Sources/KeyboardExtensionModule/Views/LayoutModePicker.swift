//
//  LayoutModePicker.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-29.
//

import SwiftUI
import KeyboardModule

struct LayoutModePicker: View {
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View {
        Picker(selection: $keyboard.layoutMode, label: EmptyView()) {
            Text(String.horizontalModeLabel).tag(Keyboard.KeyboardLayoutMode.horizontal)
            Text(String.verticalModeLabel).tag(Keyboard.KeyboardLayoutMode.vertical)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

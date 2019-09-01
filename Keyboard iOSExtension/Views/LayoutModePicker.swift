//
//  LayoutModePicker.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-29.
//

import SwiftUI

@available(iOS 13.0, *)
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

@available(iOS 13.0, *)
struct LayoutModePicker_Previews: PreviewProvider {
    static var previews: some View {
        LayoutModePicker().environmentObject(Keyboard.default)
    }
}

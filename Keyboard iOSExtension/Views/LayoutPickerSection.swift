//
//  LayoutPickerSection.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-08-31.
//

import SwiftUI

@available(iOS 13.0, *)
struct LayoutPickerSection: View {
    @EnvironmentObject var locale: Locale
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View {
        Section(header: Text(KEYBOARD.uppercasedString)) {
            ForEach(KeyboardLayout.list) { layout in
                Button(action: {self.keyboard.layout = layout}) {
                    HStack {
                        Text(layout.name)
                        
                        Spacer()

                        if layout == self.keyboard.layout {
                            Image.checkmark.foregroundColor(.accentColor)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

@available(iOS 13.0, *)
struct LayoutPickerSection_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPickerSection().localized().environmentObject(Keyboard.default)
    }
}

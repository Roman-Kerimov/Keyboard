//
//  CharacterSearchToolTip.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-08-05.
//

import SwiftUI

struct CharacterSearchToolTip: NSViewRepresentable {
    @EnvironmentObject var characterSearch: CharacterSearch
    
    let item: Int
    
    func makeNSView(context: NSViewRepresentableContext<CharacterSearchToolTip>) -> NSView {
        return .init()
    }
    
    func updateNSView(_ nsView: NSView, context: NSViewRepresentableContext<CharacterSearchToolTip>) {
        nsView.toolTip = characterSearch.foundUnicodeItems[item].localizedName
    }
}
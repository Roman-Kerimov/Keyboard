//
//  KeyboardApp.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2022-07-26.
//

import SwiftUI
import KeyboardGuide
import UnicodeData

@main
struct KeyboardApp: App {
    
    init() {
        UnicodeData.default.loadIfNeeded()
    }
    
    var body: some Scene {
        WindowGroup {
            GuideNavigationView().localized()
        }
    }
}

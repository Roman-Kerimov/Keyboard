//
//  LegalNoticesWindow.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2019-07-14.
//

import SwiftUI

final class LegalNoticesWindow: GuideWindow {
    
    override func updateLocalizedStrings() {
        title = LEGAL_NOTICES.string
    }
    
    override init() {
        super.init()
        
        contentView = NSHostingView(rootView: LegalNoticesView().localized())
        setContentSize(.init(width: 480, height: 500))
        backgroundColor = .textBackgroundColor
        center()
    }
}

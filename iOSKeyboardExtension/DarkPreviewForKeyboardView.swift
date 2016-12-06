//
//  DarkPreviewForKeyboardView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 06.12.16.
//
//

import UIKit

class DarkPreviewForKeyboardView: KeyboardView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        colorScheme = .dark
    }

}

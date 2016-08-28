//
//  Constants.swift
//  Keyboard
//
//  Created by Roman Kerimov on 19.07.16.
//
//

import UIKit

let keySpace: CGFloat = 8
let maxKeySide: CGFloat = 94

var keySize: CGSize {
    let screenRect = UIScreen.main.bounds
    
    let shortScreenSide = min(screenRect.width, screenRect.height)
    let longScreenSide = max(screenRect.width, screenRect.height)
    
    let keyWidthByScreen = min(shortScreenSide/5, longScreenSide/10)
    let keyHeightByScreen = min(shortScreenSide/2/4, longScreenSide/2/7)
    
    let maxKeySide = CGFloat(85)
    
    let keyWidth = min(keyWidthByScreen, maxKeySide)
    let keyHeight = min(keyHeightByScreen, maxKeySide)
    
    return CGSize(width: keyWidth, height: keyHeight)
}

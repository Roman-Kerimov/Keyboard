//
//  UIFont.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-04-22.
//

import UIKit

extension UIFont {
    static func characterFont(ofSize size: CGFloat) -> UIFont {
        return UIFont.init(name: "STIXGeneral", size: size)!
    }
    
    static var boldMenuFont: UIFont {
        return boldSystemFont(ofSize: systemFontSize * 1.3)
    }
}

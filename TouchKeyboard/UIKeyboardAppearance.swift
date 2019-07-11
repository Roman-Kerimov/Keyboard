//
//  UIKeyboardAppearance.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-07-08.
//

import UIKit

extension UIKeyboardAppearance {
    static var current: UIKeyboardAppearance = .default
}

extension UIColor {
    
    
    // MARK: - Label Colors
    
    static var labelColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.847) : .init(white: 0, alpha: 0.847)
    }
    
    static var secondaryLabelColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.549) : UIColor.init(white: 0, alpha: 0.498)
    }
   
    static var tertiaryLabelColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.247) : UIColor.init(white: 0, alpha: 0.247)
    }
    
    static var quaternaryLabelColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.098) : .init(white: 0, alpha: 0.098)
    }
    
    
    // MARK: - Text Colors
    
    static var unemphasizedSelectedTextColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .white : .black
    }
    
    static var unemphasizedSelectedTextBackgroundColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 0.275, alpha: 1) : .init(white: 0.863, alpha: 1)
    }
    
    
    // MARK: - Control colors
    
    private static let view: UIView = .init()
    
    static var controlAccentColor: UIColor {
        return view.tintColor
    }
    
    static var controlColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.247) : .white
    }
    
    static var disabledControlTextColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 1, alpha: 0.247) : .init(white: 0, alpha: 0.247)
    }
    
    static let alternateSelectedControlTextColor: UIColor = .white
    
    
    // MARK: - Window Colors
    
    static var windowBackgroundColor: UIColor {
        return UIKeyboardAppearance.current == .dark ? .init(white: 0.196, alpha: 1) : .init(white: 0.925, alpha: 1)
    }
}

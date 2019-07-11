//
//  UIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-11.
//

import UIKit

extension UIView {
    
    var controller: UIViewController? {
        return next as? UIViewController
    }
    
    var cornerRadius: CGFloat {
        get {
            #if os(macOS)
            return layer?.cornerRadius ?? 0
            #else
            return layer.cornerRadius
            #endif
        }
        
        set {
            #if os(macOS)
            wantsLayer = true
            layer?.cornerRadius = newValue
            #else
            layer.cornerRadius = newValue
            #endif
        }
    }
}

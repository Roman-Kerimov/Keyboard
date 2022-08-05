//
//  UIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-11.
//

import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
}

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
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @objc func willAppear(_ animated: Bool) {
        
    }
}

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
}

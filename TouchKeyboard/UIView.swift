//
//  UIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-11.
//

import UIKit

extension UIView {
    var parentViews: [UIView?] {
        guard let superview = superview else {
            return .init()
        }
        
        return [superview] + superview.parentViews
    }
    
    var controller: UIViewController? {
        return next as? UIViewController
    }
}

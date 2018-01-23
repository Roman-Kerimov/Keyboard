//
//  UIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 11/06/2017.
//

import UIKit

extension UIView {
    var parentViews: [UIView?] {
        guard let superview = superview else {
            return .init()
        }
        
        return [superview] + superview.parentViews
    }
}

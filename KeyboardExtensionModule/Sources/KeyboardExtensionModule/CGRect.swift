//
//  CGRect.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-11-02.
//

import CoreGraphics

extension CGRect {
    func insetBy(scalar: CGFloat) -> CGRect {
        return insetBy(dx: scalar, dy: scalar)
    }
}

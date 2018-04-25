//
//  CGAffineTransform.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-04-25.
//

import CoreGraphics

extension CGAffineTransform {
    init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
}

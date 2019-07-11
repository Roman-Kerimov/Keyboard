//
//  ReuseIdentifier.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-11-30.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return .init(describing: self)
    }
}

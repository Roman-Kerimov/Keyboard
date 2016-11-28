//
//  ShiftLabel.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 28.11.16.
//
//

import UIKit

class ShiftLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRect())
        
        translatesAutoresizingMaskIntoConstraints = false
        textColor = UIColor.lightGray
        adjustsFontSizeToFitWidth = true
        baselineAdjustment = .alignCenters
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

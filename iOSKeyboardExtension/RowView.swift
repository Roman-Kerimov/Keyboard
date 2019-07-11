//
//  RowView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 22.02.17.
//
//

import UIKit

class RowView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGSize, labelFontSize: CGFloat) {
        frame.size = size
    }
}

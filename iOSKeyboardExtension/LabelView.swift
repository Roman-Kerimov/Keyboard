//
//  LabelView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 28.11.16.
//
//

import UIKit

class LabelView: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var text: String? {
        didSet {
            super.text = text
            
            frame.size = intrinsicContentSize
            
            for view in parentViews {
                if let configureView = view as? ConfigurableView {
                    configureView.configure()
                }
            }
        }
    }
    
    override var font: UIFont! {
        didSet {
            super.font = font
            
            frame.size = intrinsicContentSize
        }
    }
    
    init() {
        super.init(frame: CGRect())
        
        adjustsFontSizeToFitWidth = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

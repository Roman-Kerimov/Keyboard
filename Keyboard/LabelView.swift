//
//  LabelView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-11-28.
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
        get {
            return super.text
        }
        
        set {
            switch newValue ?? .init() {
            case .return:
                super.text = "return"
                
            case .tab:
                super.text = "tab"
                
            default:
                super.text = newValue?.applyingScriptComponent()
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
        textAlignment = .center
        
        NotificationCenter.default.addObserver(self, selector: #selector(applyScriptComponent), name: .DocumentContextDidChange, object: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func applyScriptComponent() {
        text = text?.applyingScriptComponent()
    }
}

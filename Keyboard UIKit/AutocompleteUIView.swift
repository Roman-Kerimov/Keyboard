//
//  AutocompleteUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-11-30.
//

import UIKit

class AutocompleteUIView: UICollectionReusableView {
    
    var text: String {
        get {
            return button.title(for: .normal) ?? .init()
        }
        
        set {
            button.setTitle(newValue, for: .normal)
        }
    }
    
    var font: UIFont {
        get {
            return button.titleLabel!.font
        }
        
        set {
            button.titleLabel?.font = newValue
        }
    }
    
    private let button: UIButton = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
        
        button.setTitleColor(tintColor, for: .normal)
        
        button.addTarget(Keyboard.default.characterSequence, action: #selector(Keyboard.default.characterSequence.autocomplete), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        button.frame.size = frame.size
    }
}

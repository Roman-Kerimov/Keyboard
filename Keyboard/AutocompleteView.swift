//
//  AutocompleteView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-11-30.
//

import UIKit

class AutocompleteView: UICollectionReusableView {
    
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
        
        button.addTarget(Keyboard.default, action: #selector(Keyboard.default.autocomplete), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    #if os(macOS)
    override func layout() {crossLayout()}
    #else
    override func layoutSubviews() {crossLayout()}
    #endif
    func crossLayout() {
        button.frame.size = frame.size
    }
}

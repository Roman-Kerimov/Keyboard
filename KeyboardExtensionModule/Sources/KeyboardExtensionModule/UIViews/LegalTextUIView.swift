//
//  LegalTextUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import UIKit

public class LegalTextUIView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    init(text: String) {
        super.init(frame: .zero, textContainer: nil)

        isEditable = false
        isSelectable = false
        
        self.text = text
        self.font = UIFont.init(name: .legalTextFontName, size: .legalTextFontSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

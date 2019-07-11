//
//  LegalNoticesTextView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import UIKit

class LegalNoticesTextView: LegalTextView {
    
    init() {
        super.init(text: legalNoticesText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LegalNoticesTextView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-08-09.
//

import UIKit

class LegalNoticesTextView: LegalTextView {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        controller?.title = LEGAL_NOTICES.string
    }
    
    init() {
        super.init(text: legalNoticesText)
        
        NotificationCenter.default.addLocaleObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LegalNoticesUIViewCell.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 2019-03-22.
//

import UIKit

class LegalNoticesUIViewCell: LocalizedUIViewCell {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        textLabel?.text = LEGAL_NOTICES.string
        accessoryType = .disclosureIndicator
    }
    
    override init() {
        super.init()
        
        detailViewController = ViewController<LegalNoticesUIView>.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

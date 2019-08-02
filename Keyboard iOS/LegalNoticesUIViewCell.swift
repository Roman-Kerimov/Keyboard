//
//  LegalNoticesUIViewCell.swift
//  Keyboard iOS
//
//  Created by Roman Kerimov on 2019-03-22.
//

import SwiftUI

class LegalNoticesUIViewCell: LocalizedUIViewCell {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        textLabel?.text = LEGAL_NOTICES.string
        accessoryType = .disclosureIndicator
    }
    
    override init() {
        super.init()
        
        if #available(iOS 13.0, *) {
            detailViewController = UIHostingController.init(rootView: LegalNoticesView().localized())
        } else {
            detailViewController = ViewController<LegalNoticesUIView>.init()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

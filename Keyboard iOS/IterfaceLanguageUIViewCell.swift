//
//  IterfaceLanguageUIViewCell.swift
//  Keyboard iOS
//
//  Created by Roman Kerimov on 2019-03-22.
//

import SwiftUI

class IterfaceLanguageUIViewCell: LocalizedUIViewCell {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        textLabel?.text = LANGUAGE.string
        detailTextLabel?.text = Locale.current.language.localizedName
        accessoryType = .disclosureIndicator
    }
    
    override init() {
        super.init()
        
        if #available(iOS 13.0, *) {
            detailViewController = UIHostingController(rootView: InterfaceLanguageList().localized())
        } else {
            detailViewController = ViewController<LanguagesUIView>.init()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

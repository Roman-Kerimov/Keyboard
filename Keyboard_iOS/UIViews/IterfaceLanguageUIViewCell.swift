//
//  IterfaceLanguageUIViewCell.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2019-03-22.
//

import UIKit

class IterfaceLanguageUIViewCell: LocalizedUIViewCell {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        textLabel?.text = LANGUAGE.string
        detailTextLabel?.text = Locale.current.language.localizedName
        accessoryType = .disclosureIndicator
    }
    
    override init() {
        super.init()
        
        detailViewController = ViewController<LanguagesUIView>.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

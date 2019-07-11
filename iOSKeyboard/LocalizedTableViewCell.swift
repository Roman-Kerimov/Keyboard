//
//  LocalizedTableViewCell.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 2019-03-22.
//

import UIKit

class LocalizedTableViewCell: UITableViewCell {
    
    var detailViewController: UIViewController? = nil
    
    init() {
        super.init(style: .value1, reuseIdentifier: nil)
        
        NotificationCenter.default.addLocaleObserver(self)
        updateLocalizedStrings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

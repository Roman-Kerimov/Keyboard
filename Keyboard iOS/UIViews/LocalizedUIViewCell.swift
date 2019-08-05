//
//  LocalizedUIViewCell.swift
//  Keyboard iOS
//
//  Created by Roman Kerimov on 2019-03-22.
//

import UIKit

class LocalizedUIViewCell: UITableViewCell {
    
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

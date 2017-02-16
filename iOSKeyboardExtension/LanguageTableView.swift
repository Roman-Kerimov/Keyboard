//
//  LanguageTableView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 15.02.17.
//
//

import UIKit

class LanguageTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    internal init() {
        super.init(frame: .zero, style: .grouped)
        
        delegate = self
        dataSource = self
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Language.current = Language.list[indexPath.row]
        
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Language.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let language = Language.list[indexPath.row]
        let locale = Locale(identifier: language.rawValue)
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = locale.localizedString(forIdentifier: language.rawValue)
        cell.detailTextLabel?.text = Locale(identifier: Language.current.rawValue).localizedString(forIdentifier: language.rawValue)
        
        if language == Language.current {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
}

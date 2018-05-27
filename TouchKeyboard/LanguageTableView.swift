//
//  LanguageTableView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-15.
//
//

import UIKit

class LanguageTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override func updateLocalizedStrings() {
        preferredLanguages = Language.preferredList
        reloadData()
        
        controller?.title = LANGUAGE.string
    }

    internal init() {
        super.init(frame: .zero, style: .grouped)
        
        delegate = self
        dataSource = self
    
        NotificationCenter.default.addLocaleObserver(self)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Section: EnumCases {
        case preferredLanguages, allLanguages
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section.cases[indexPath.section] {
            
        case .preferredLanguages:
            Language.current = preferredLanguages[indexPath.row]

        case .allLanguages:
            Language.current = Language.cases[indexPath.row]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.cases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Section.cases[section] {
            
        case .preferredLanguages:
            return preferredLanguages.count
            
        case .allLanguages:
            return Language.cases.count
        }
    }
    
    private var preferredLanguages: [Language] = [.en, .ru]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let language: Language
        
        switch Section.cases[indexPath.section] {
            
        case .preferredLanguages:
            language = preferredLanguages[indexPath.row]
            
        case .allLanguages:
            language = Language.cases[indexPath.row]
        }
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = language.selfName
        cell.detailTextLabel?.text = language.localizedName
        cell.accessoryType = language == Language.current ? .checkmark : .none
        
        return cell
    }
}

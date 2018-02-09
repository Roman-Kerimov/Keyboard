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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Section {
        case preferredLanguages, allLanguages
        
        static let list = values(of: Section.self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section.list[indexPath.section] {
            
        case .preferredLanguages:
            Language.current = preferredLanguages[indexPath.row]

        case .allLanguages:
            Language.current = Language.list[indexPath.row]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Section.list[section] {
            
        case .preferredLanguages:
            return preferredLanguages.count
            
        case .allLanguages:
            return Language.list.count
        }
    }
    
    private var preferredLanguages: [Language] = [.en, .ru]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let language: Language
        
        switch Section.list[indexPath.section] {
            
        case .preferredLanguages:
            language = preferredLanguages[indexPath.row]
            
        case .allLanguages:
            language = Language.list[indexPath.row]
        }
        
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

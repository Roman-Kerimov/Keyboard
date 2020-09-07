//
//  LanguagesUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-15.
//
//

import UIKit
import KeyboardModule

class LanguagesUIView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
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
    
    private enum Section: CaseIterable {
        case preferredLanguages, allLanguages
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section.allCases[indexPath.section] {
            
        case .preferredLanguages:
            Settings.current.language = preferredLanguages[indexPath.row]

        case .allLanguages:
            Settings.current.language = Language.allCases[indexPath.row]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Section.allCases[section] {
            
        case .preferredLanguages:
            return preferredLanguages.count
            
        case .allLanguages:
            return Language.allCases.count
        }
    }
    
    private var preferredLanguages: [Language] = [.en, .ru_Cyrl]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let language: Language
        
        switch Section.allCases[indexPath.section] {
            
        case .preferredLanguages:
            language = preferredLanguages[indexPath.row]
            
        case .allLanguages:
            language = Language.allCases[indexPath.row]
        }
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = language.selfName
        cell.detailTextLabel?.text = language.localizedName
        cell.accessoryType = language == Settings.current.language ? .checkmark : .none
        
        return cell
    }
}

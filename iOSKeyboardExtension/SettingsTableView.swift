//
//  SettingsViewController.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 12.01.17.
//
//

import UIKit

@IBDesignable
internal class SettingsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        reloadData()
        
        languageTableViewController.title = LANGUAGE.string
        legalNoticesViewController.title = LEGAL_NOTICES.string
    }
    
    internal init() {
        super.init(frame: .zero, style: .grouped)
        
        delegate = self
        dataSource = self
        
        if KeyboardViewController.shared.isExtension {
            contentInset = .init(top: -20, left: 0, bottom: 0, right: 0)
            scrollIndicatorInsets = contentInset
        }
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    internal enum Section {
        case keyboardLayouts, appLanguage, about
        
        static let list = values(of: Section.self)
    }
    
    private enum BoolCell {
        case allowMultipleSpaces
        
        static let list = values(of: BoolCell.self)
    }
    
    internal let languageTableViewController: ViewController<LanguageTableView> = .init()
    internal let legalNoticesViewController: ViewController<LegalNoticesTextView> = .init()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        switch Section.list[indexPath.section] {
            
        case .keyboardLayouts:
            for cell in tableView.visibleCells {
                cell.accessoryType = .none
            }
            
            cell.accessoryType = .checkmark
            
            KeyboardViewController.shared.keyboardView.layout = KeyboardLayout.list[indexPath.row]
            
        case .appLanguage:
            KeyboardViewController.shared.keyboardView.settingsContainerView.navigationController
                .pushViewController(languageTableViewController, animated: true)
            
        case .about:
            KeyboardViewController.shared.keyboardView.settingsContainerView.navigationController
                .pushViewController(legalNoticesViewController, animated: true)
        }
        
        cell.isSelected = false
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Section.list.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch Section.list[section] {
            
        case .keyboardLayouts:
            return KeyboardLayout.list.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section.list[section] {
            
        case .keyboardLayouts:
            return KEYBOARD.string
            
        case .about:
            return ABOUT.string
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch Section.list[section] {
            
        case .about:
            let bundle: Bundle = .init(for: type(of: self))
            let versionNumber = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            let buildNumber = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            return "\(VERSION.string): \(versionNumber) (\(buildNumber))"
            
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        switch Section.list[indexPath.section] {
            
        case .keyboardLayouts:
            let layout = KeyboardLayout.list[indexPath.row]
            
            cell.textLabel?.text = layout.name
            
            if layout.name == KeyboardSettings.shared.layout.name {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
            
        case .appLanguage:
            cell.textLabel?.text = LANGUAGE.string
            
            let languageCode = Language.current.rawValue
            let locale = Locale(identifier: languageCode)
            
            if locale.scriptCode == nil {
                cell.detailTextLabel?.text = locale.localizedString(forIdentifier: languageCode)
            }
            else {
                cell.detailTextLabel?.text = locale.localizedString(forLanguageCode: locale.languageCode!)
            }
            
            cell.accessoryType = .disclosureIndicator
            
        case .about:
            cell.textLabel?.text = LEGAL_NOTICES.string
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

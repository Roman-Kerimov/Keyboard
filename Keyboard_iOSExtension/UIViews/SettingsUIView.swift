//
//  SettingsUIView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-01-12.
//
//

import UIKit
import KeyboardModule

internal class SettingsUIView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        reloadData()
        
        controller?.title = SETTINGS.string
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
        
    internal enum Section: CaseIterable {
        case keyboardLayouts, appLanguage, about
    }
    
    private enum BoolCell: CaseIterable {
        case allowMultipleSpaces
    }
    
    internal let languageTableViewController: UIViewController = ViewController<LanguagesUIView>()
    internal let legalNoticesViewController: UIViewController = ViewController<LegalNoticesUIView>()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        switch Section.allCases[indexPath.section] {
            
        case .keyboardLayouts:
            for cell in tableView.visibleCells {
                cell.accessoryType = .none
            }
            
            cell.accessoryType = .checkmark
            
            Keyboard.default.layout = KeyboardLayout.list[indexPath.row]
            
        case .appLanguage:
            controller?.navigationController?.pushViewController(languageTableViewController, animated: true)
            
        case .about:
            controller?.navigationController?.pushViewController(legalNoticesViewController, animated: true)
        }
        
        cell.isSelected = false
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch Section.allCases[section] {
            
        case .keyboardLayouts:
            return KeyboardLayout.list.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section.allCases[section] {
            
        case .keyboardLayouts:
            return KEYBOARD.string
            
        case .about:
            return ABOUT.string
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch Section.allCases[section] {
            
        case .about:
            return VERSION.string
            
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        switch Section.allCases[indexPath.section] {
            
        case .keyboardLayouts:
            let layout = KeyboardLayout.list[indexPath.row]
            
            cell.textLabel?.text = layout.name
            
            if layout.name == Keyboard.default.layout.name {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
            
        case .appLanguage:
            cell.textLabel?.text = LANGUAGE.string
            
            cell.detailTextLabel?.text = Settings.current.language.localizedName
            
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

//
//  SettingsViewController.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 12.01.17.
//
//

import UIKit

@IBDesignable
class SettingsView: UIStackView, UITableViewDelegate, UITableViewDataSource {
    
    @IBInspectable var language: String?
    
    let shadeColor = UIColor.black.withAlphaComponent(0.3)
    
    let settings = KeyboardSettings()
    
    let backButton = UIButton()
    
    let tableView = UITableView(frame: CGRect(), style: .grouped)
    
    var widthConstraint: NSLayoutConstraint!
    
    weak var settingsViewController: SettingsViewController?
    
    override func prepareForInterfaceBuilder() {
        initialize()
        
        backButton.backgroundColor = shadeColor
        Internationalize.language = Language(rawValue: language ?? Language.en.rawValue)!
    }

    func initialize() {
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        axis = .horizontal
        distribution = .fill
        
        translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(backButton)
        addArrangedSubview(tableView)
        
        widthConstraint = tableView.widthAnchor.constraint(equalToConstant: 280)
        widthConstraint.isActive = true
        
        Internationalize.setString {
            self.tableView.reloadData()
        }
    }
    
    private enum Section {
        case keyboardLayouts, boolSection
    }
    
    private let sections: [Section] = [.keyboardLayouts, .boolSection]
    
    private enum BoolCell {
        case allowMultipleSpaces
    }
    private let boolCells: [BoolCell] = [.allowMultipleSpaces]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        switch sections[indexPath.section] {
        case .keyboardLayouts:
            for cell in tableView.visibleCells {
                cell.accessoryType = .none
            }
            
            cell.accessoryType = .checkmark
            
            settings.layout = KeyboardLayout.list[indexPath.row]
            
            (settingsViewController?.parent as! KeyboardViewController).updateKeyboardLayout()
            
        case .boolSection:
            break
        }
        
        cell.isSelected = false
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch sections[section] {
        case .keyboardLayouts:
            return KeyboardLayout.list.count
        case .boolSection:
            return boolCells.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch sections[section] {
        case .keyboardLayouts:
            return KeyboardLayoutSectionTitle.string
        case .boolSection:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch sections[section] {
        case .keyboardLayouts:
            return nil
        case .boolSection:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        switch sections[indexPath.section] {
        case .keyboardLayouts:
            let layout = KeyboardLayout.list[indexPath.row]
            
            cell.textLabel?.text = layout.name
            
            if layout.name == settings.layout.name {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
	
        case .boolSection:
            let cellSwitch = UISwitch()
            
            cell.accessoryView = cellSwitch
            
            cellSwitch.addTarget(self, action: #selector(switchDidChange(sender:)), for: .allEvents)
            
            switch boolCells[indexPath.row] {
            case .allowMultipleSpaces:
                cell.textLabel?.text = AllowMultipleSpacesTitle.string
                cellSwitch.isOn = settings.allowMultipleSpaces
            }
        }
        
        return cell
    }
    
    func switchDidChange(sender: UISwitch) {
        switch boolCells[tableView.indexPath(for: sender.superview as! UITableViewCell)!.row] {
        case .allowMultipleSpaces:
            settings.allowMultipleSpaces = sender.isOn
        }
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

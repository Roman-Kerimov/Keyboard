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
        
        languageTableViewController.title = AppLanguageTitle.string
    }
    
    internal init() {
        super.init(frame: .zero, style: .grouped)
        
        delegate = self
        dataSource = self
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private enum Section {
        case keyboardMode, keyboardLayouts, boolSection, appLanguage
        
        static let list = values(of: Section.self)
    }
    
    private enum BoolCell {
        case allowMultipleSpaces
        
        static let list = values(of: BoolCell.self)
    }
    
    private let languageTableViewController: ViewController<LanguageTableView> = .init()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        switch Section.list[indexPath.section] {
            
        case .keyboardLayouts:
            for cell in tableView.visibleCells {
                cell.accessoryType = .none
            }
            
            cell.accessoryType = .checkmark
            
            KeyboardSettings.shared.layout = KeyboardLayout.list[indexPath.row]
            
            KeyboardViewController.shared.keyboardView.layoutView.layout = KeyboardSettings.shared.layout
            
        case .appLanguage:
            KeyboardViewController.shared.keyboardView.settingsContainerView.navigationController.pushViewController(languageTableViewController, animated: true)
            
        default:
            break
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
            
        case .boolSection:
            return BoolCell.list.count
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section.list[section] {
            
        case .keyboardLayouts:
            return KeyboardLayoutSectionTitle.string
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        switch Section.list[indexPath.section] {
            
        case .keyboardMode:
            let layoutModeSegmentedControlItems = [SpecialKey.horizontalMode.label, SpecialKey.verticalMode.label]
            let layoutModeSegmentedControl = UISegmentedControl(items: layoutModeSegmentedControlItems)
            
            switch KeyboardSettings.shared.layoutMode {
            case .horizontal:
                layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.index(of: SpecialKey.horizontalMode.label)!
                
            case .vertical:
                layoutModeSegmentedControl.selectedSegmentIndex = layoutModeSegmentedControlItems.index(of: SpecialKey.verticalMode.label)!
                
            case .default:
                layoutModeSegmentedControl.selectedSegmentIndex = 0
            }
            
            layoutModeSegmentedControl.addTarget(self, action: #selector(action(layoutModeSegmentedControl:)), for: .allEvents)
            
            cell.accessoryView = layoutModeSegmentedControl
            cell.textLabel?.text = KeyboardShapeCellTitle.string
            
        case .keyboardLayouts:
            let layout = KeyboardLayout.list[indexPath.row]
            
            cell.textLabel?.text = layout.name
            
            if layout.name == KeyboardSettings.shared.layout.name {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
	
        case .boolSection:
            let cellSwitch = UISwitch()
            
            cell.accessoryView = cellSwitch
            
            cellSwitch.addTarget(self, action: #selector(switchDidChange(sender:)), for: .allEvents)
            
            switch BoolCell.list[indexPath.row] {
            case .allowMultipleSpaces:
                cell.textLabel?.text = AllowMultipleSpacesTitle.string
                cellSwitch.isOn = KeyboardSettings.shared.allowMultipleSpaces
            }
            
        case .appLanguage:
            cell.textLabel?.text = AppLanguageTitle.string
            
            let languageCode = Language.current.rawValue
            let locale = Locale(identifier: languageCode)
            
            if locale.scriptCode == nil {
                cell.detailTextLabel?.text = locale.localizedString(forIdentifier: languageCode)
            }
            else {
                cell.detailTextLabel?.text = locale.localizedString(forLanguageCode: locale.languageCode!)
            }
            
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    @objc private func action(layoutModeSegmentedControl: UISegmentedControl) {
        let selectedSegmentIndex = layoutModeSegmentedControl.selectedSegmentIndex
        let selectedSegmentTitle = layoutModeSegmentedControl.titleForSegment(at: selectedSegmentIndex)!
        
        KeyboardViewController.shared.keyAction(label: selectedSegmentTitle)
    }
    
    func switchDidChange(sender: UISwitch) {
        switch BoolCell.list[indexPath(for: sender.superview as! UITableViewCell)!.row] {
        case .allowMultipleSpaces:
            KeyboardSettings.shared.allowMultipleSpaces = sender.isOn
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

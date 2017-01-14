//
//  SettingsViewController.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 12.01.17.
//
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settings = KeyboardSettings()
    
    let backButton = UIButton()
    
    let tableView = UITableView(frame: CGRect(), style: .grouped)
    
    var widthConstraint: NSLayoutConstraint!
    
    var stackView: UIStackView {
        return view as! UIStackView
    }
    
    override func loadView() {
        view = UIStackView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.01)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        view.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(tableView)
        
        widthConstraint = tableView.widthAnchor.constraint(equalToConstant: 280)
        widthConstraint.isActive = true
        
        Internationalize.setString {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for cell in tableView.visibleCells {
            cell.accessoryType = .none
        }
        
        let cell = tableView.cellForRow(at: indexPath)!
        
        cell.accessoryType = .checkmark
        cell.isSelected = false
        
        settings.layout = KeyboardLayout.list[indexPath.row]
        
        (parent as! KeyboardViewController).updateKeyboardLayout()
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return KeyboardLayout.list.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return KeyboardLayoutSectionTitle.string
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let layout = KeyboardLayout.list[indexPath.row]
        
        cell.textLabel?.text = layout.name
        
        if layout.name == settings.layout.name {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
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

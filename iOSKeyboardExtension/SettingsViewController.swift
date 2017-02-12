//
//  SettingsViewController.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 22.01.17.
//
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsView: SettingsView {
        return view as! SettingsView
    }
    
    override func loadView() {
        view = SettingsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

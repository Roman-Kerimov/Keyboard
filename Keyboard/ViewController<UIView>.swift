//
//  ViewController<UIView>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-07.
//
//

import UIKit

class ViewController<View: UIView>: UIViewController {
    
    let rootView = View()
    
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.updateLocalizedStrings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        #if !os(macOS)
            view.willAppear(animated)
        #endif
    }

}

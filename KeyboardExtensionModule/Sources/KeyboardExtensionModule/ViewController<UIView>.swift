//
//  ViewController<UIView>.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-02-07.
//
//

import UIKit

public class ViewController<View: UIView>: UIViewController {
    
    public let rootView = View()
    
    public override func loadView() {
        view = rootView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.updateLocalizedStrings()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.willAppear(animated)
    }

}

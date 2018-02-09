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
        
        guard Bundle.main.isExtension else {
            return
        }
        
        if let scrollView = view as? UIScrollView {
            if let statusBarHeight = navigationController?.view.readableContentGuide.layoutFrame.origin.y {
                scrollView.contentInset.top = -statusBarHeight
                scrollView.scrollIndicatorInsets.top = -statusBarHeight
            }
        }
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

//
//  GuideUIViewController.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2019-03-21.
//

import UIKit
import KeyboardExtensionModule

public class GuideUIViewController: UISplitViewController {
    
    let masterViewController = ViewController<GuideTableUIView>.init()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        masterViewController.title = Bundle.main.productName
        
        viewControllers = [UINavigationController.init(rootViewController: masterViewController)]
        
        if let detailViewController = masterViewController.rootView.sections.first?.items.first?.detailViewController {
            viewControllers.append(UINavigationController.init(rootViewController: detailViewController))
        }
        
        delegate = self
        
        preferredDisplayMode = .oneBesideSecondary
    }
    
    var selectedRowIndexPath: IndexPath {
        return masterViewController.rootView.selectedRowIndexPath
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isCollapsed {
            masterViewController.rootView.selectRow(at: selectedRowIndexPath, animated: true, scrollPosition: .bottom)
        }
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil) { _ in
            if self.isCollapsed {
                self.masterViewController.rootView.deselectRow(at: self.selectedRowIndexPath, animated: true)
            }
            else {
                self.masterViewController.rootView.selectRow(at: self.selectedRowIndexPath, animated: true, scrollPosition: .bottom)
            }
        }
    }
}

extension GuideUIViewController: UISplitViewControllerDelegate {
    
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
    }
}

//
//  LegalNoticesMenuItem.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-02-11.
//

import AppKit

class LegalNoticesMenuItem: LocalizedMenuItem {
    
    let legalNoticesViewController: ViewController<LegalNoticesUIView> = .init()
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        title = LEGAL_NOTICES.string
    }
    
    var window: GuideWindow = .init()
    
    override init() {
        super.init()
        
        window.setContentSize(.init(width: 480, height: 500))
        window.contentMaxSize.width = window.frame.size.width
        window.contentMinSize.width = window.frame.size.width
        
        window.styleMask = [.resizable, .closable, .titled]
        window.isReleasedWhenClosed = false
        
        window.contentView = legalNoticesViewController.view
        window.bind(.title, to: legalNoticesViewController, withKeyPath: "title", options: nil)
        window.center()
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func menuItemAction() {
        window.orderFrontRegardless()
    }
}

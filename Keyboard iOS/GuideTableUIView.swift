//
//  GuideTableUIView.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 2019-03-21.
//

import UIKit

class GuideTableUIView: UITableView {
    
    override func updateLocalizedStrings() {
        reloadData()
        selectRow(at: selectedRowIndexPath, animated: false, scrollPosition: .bottom)
    }
    
    struct Section {
        
        init(header: LocalizedString.Type? = nil, items: [LocalizedUIViewCell], footer: LocalizedString.Type? = nil) {
            self.header = header
            self.items = items
            self.footer = footer
        }
        
        let header: LocalizedString.Type?
        let items: [LocalizedUIViewCell]
        let footer: LocalizedString.Type?
    }
    
    var sections: [Section] = [
        Section.init(
            header: SETTINGS.self,
            items: [
                IterfaceLanguageUIViewCell.init(),
            ]
        ),
        
        Section.init(
            header: ABOUT.self, items: [
                LegalNoticesUIViewCell.init(),
            ],
            footer: VERSION.self
        )
    ]
    
    var selectedRowIndexPath = IndexPath.init(item: 0, section: 0)

    init() {
        super.init(frame: .zero, style: .grouped)
        
        NotificationCenter.default.addLocaleObserver(self)
        
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willAppear(_ animated: Bool) {
        super.willAppear(animated)
        
        controller?.navigationController?.navigationBar.prefersLargeTitles = true
        
        if splitViewController?.isCollapsed == true {
            if let indexPathForSelectedRow = indexPathForSelectedRow {
                deselectRow(at: indexPathForSelectedRow, animated: true)
            }
        }
    }
    
    var splitViewController: UISplitViewController? {
        return controller?.parent?.parent as? UISplitViewController
    }
}

extension GuideTableUIView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].items[indexPath.item]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header?.string
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer?.string
    }
}

extension GuideTableUIView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRowIndexPath = indexPath
        
        guard let detailViewController = sections[indexPath.section].items[indexPath.item].detailViewController else {
            return
        }
        
        let navigationController = UINavigationController.init(rootViewController: detailViewController)
        splitViewController?.showDetailViewController(navigationController, sender: nil)
        detailViewController.navigationItem.largeTitleDisplayMode = .never
    }
}

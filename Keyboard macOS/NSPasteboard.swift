//
//  NSPasteboard.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2018-03-09.
//

import AppKit

extension NSPasteboard {
    var archivedItems: [NSPasteboardItem] {
        var archivedItems: [NSPasteboardItem] = []
        for item in pasteboardItems ?? .init() {
            let archivedItem: NSPasteboardItem = .init()
            
            for type in item.types {
                guard let data = item.data(forType: type) else {
                    continue
                }

                archivedItem.setData(data, forType: type)
            }
            
            archivedItems.append(archivedItem)
        }
        
        return archivedItems
    }
    
    func restore(archivedItems: [NSPasteboardItem]) {
        clearContents()
        writeObjects(archivedItems)
    }
}

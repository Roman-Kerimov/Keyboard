//
//  TISInputSource.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2018-03-18.
//

import Carbon

extension TISInputSource {
    static var currentKeyboardLayout: TISInputSource {
        return TISCopyCurrentKeyboardLayoutInputSource().takeRetainedValue()
    }
    
    static var inputSourceList: [TISInputSource] { 
        return TISCreateInputSourceList(nil, true)?.takeRetainedValue() as! [TISInputSource]
    }
    
    private func get(property: CFString) -> String {
        let propertyPointer = TISGetInputSourceProperty(self, property)
        return Unmanaged<CFString>.fromOpaque(propertyPointer!).takeUnretainedValue() as String
    }
    
    private func get(property: CFString) -> Bool {
        let propertyPointer = TISGetInputSourceProperty(self, property)
        return Unmanaged<CFBoolean>.fromOpaque(propertyPointer!).takeUnretainedValue() as! Bool
    }
    
    private func get(property: CFString) -> Data {
        let propertyPointer = TISGetInputSourceProperty(self, property)
        return Unmanaged<CFData>.fromOpaque(propertyPointer!).takeUnretainedValue() as Data
    }
    
    var id: String {
        return get(property: kTISPropertyInputSourceID)
    }
    
    var isASCIICapable: Bool {
        return get(property: kTISPropertyInputSourceIsASCIICapable)
    }
    
    var unicodeKeyLayoutData: Data {
        return get(property: kTISPropertyUnicodeKeyLayoutData)
    }
}

extension Array where Element == TISInputSource {
    subscript(id: String) -> Element? {
        
        guard let index = map({$0.id}).firstIndex(of: id) else {
            return nil
        }
        
        return self[index]
    }
}

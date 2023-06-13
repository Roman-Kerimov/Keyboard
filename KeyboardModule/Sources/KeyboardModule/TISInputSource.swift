//
//  TISInputSource.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-03-18.
//

#if canImport(Carbon)
import Carbon

public extension TISInputSource {
    static var currentKeyboardLayout: TISInputSource {
        TISCopyCurrentKeyboardLayoutInputSource().takeRetainedValue()
    }
    
    static var inputSourceList: [TISInputSource] { 
        TISCreateInputSourceList(nil, true)?.takeRetainedValue() as! [TISInputSource]
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
        get {
            get(property: kTISPropertyInputSourceID)
        }
    }
    
    var isASCIICapable: Bool {
        get {
            get(property: kTISPropertyInputSourceIsASCIICapable)
        }
    }
    
    var unicodeKeyLayoutData: Data {
        get {
            get(property: kTISPropertyUnicodeKeyLayoutData)
        }
    }
}

public extension Array where Element == TISInputSource {
    subscript(id: String) -> Element {
        guard let index = map({$0.id}).firstIndex(of: id) else {
            return TISInputSource.currentKeyboardLayout
        }
        
        return self[index]
    }
}
#endif

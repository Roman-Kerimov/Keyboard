//
//  AXAttribute.swift
//  Keyboard_macOS
//
//  Created by Roman Kerimov on 2018-02-21.
//

import Foundation
import ApplicationServices

enum AXAttribute {
    case allowedValues
    case AMPMField
    case cancelButton
    case children
    case closeButton
    case columnTitle
    case contents
    case dayField
    case defaultButton
    case description
    case enabled
    case focused
    case growArea
    case header
    case help
    case hourField
    case incrementor
    case insertionPointLineNumber
    case main
    case maxValue
    case minimizeButton
    case minimized
    case MinuteField
    case minValue
    case modal
    case monthField
    case numberOfCharacters
    case orientation
    case parent
    case position
    case proxy
    case role
    case roleDescription
    case secondField
    case selectedChildren
    case selectedText
    case selectedTextRange
    case selectedTextRanges
    case sharedCharacterRange
    case sharedTextUIElements
    case size
    case subrole
    case title
    case toolbarButton
    case topLevelUIElement
    case URL
    case value
    case valueDescription
    case valueIncrement
    case visibleCharacterRange
    case visibleChildren
    case visibleColumns
    case window
    case yearField
    case zoomButton
    
    var cfString: CFString {
        return self.kAX as CFString
    }
    
    private var kAX: String {
        switch self {
            
        case .allowedValues:
            return kAXAllowedValuesAttribute
            
        case .AMPMField:
            return kAXAMPMFieldAttribute
            
        case .cancelButton:
            return kAXCancelButtonAttribute
            
        case .children:
            return kAXChildrenAttribute
            
        case .closeButton:
            return kAXCloseButtonAttribute
            
        case .columnTitle:
            return kAXColumnTitleAttribute
            
        case .contents:
            return kAXContentsAttribute
            
        case .dayField:
            return kAXDayFieldAttribute
            
        case .defaultButton:
            return kAXDefaultButtonAttribute
            
        case .description:
            return kAXDescriptionAttribute
            
        case .enabled:
            return kAXEnabledAttribute
            
        case .focused:
            return kAXFocusedAttribute
            
        case .growArea:
            return kAXGrowAreaAttribute
            
        case .header:
            return kAXHeaderAttribute
            
        case .help:
            return kAXHelpAttribute
            
        case .hourField:
            return kAXHourFieldAttribute
            
        case .incrementor:
            return kAXIncrementorAttribute
            
        case .insertionPointLineNumber:
            return kAXInsertionPointLineNumberAttribute
            
        case .main:
            return kAXMainAttribute
            
        case .maxValue:
            return kAXMaxValueAttribute
            
        case .minimizeButton:
            return kAXMinimizeButtonAttribute
            
        case .minimized:
            return kAXMinimizedAttribute
            
        case .MinuteField:
            return kAXMinuteFieldAttribute
            
        case .minValue:
            return kAXMinValueAttribute
            
        case .modal:
            return kAXModalAttribute
            
        case .monthField:
            return kAXMonthFieldAttribute
            
        case .numberOfCharacters:
            return kAXNumberOfCharactersAttribute
            
        case .orientation:
            return kAXOrientationAttribute
            
        case .parent:
            return kAXParentAttribute
            
        case .position:
            return kAXPositionAttribute
            
        case .proxy:
            return kAXProxyAttribute
            
        case .role:
            return kAXRoleAttribute
            
        case .roleDescription:
            return kAXRoleDescriptionAttribute
            
        case .secondField:
            return kAXSecondFieldAttribute
            
        case .selectedChildren:
            return kAXSelectedChildrenAttribute
            
        case .selectedText:
            return kAXSelectedTextAttribute
            
        case .selectedTextRange:
            return kAXSelectedTextRangeAttribute
            
        case .selectedTextRanges:
            return kAXSelectedTextRangesAttribute
            
        case .sharedCharacterRange:
            return kAXSharedCharacterRangeAttribute
            
        case .sharedTextUIElements:
            return kAXSharedTextUIElementsAttribute
            
        case .size:
            return kAXSizeAttribute
            
        case .subrole:
            return kAXSubroleAttribute
            
        case .title:
            return kAXTitleAttribute
            
        case .toolbarButton:
            return kAXToolbarButtonAttribute
            
        case .topLevelUIElement:
            return kAXTopLevelUIElementAttribute
            
        case .URL:
            return kAXURLAttribute
            
        case .value:
            return kAXValueAttribute
            
        case .valueDescription:
            return kAXValueDescriptionAttribute
            
        case .valueIncrement:
            return kAXValueIncrementAttribute
            
        case .visibleCharacterRange:
            return kAXVisibleCharacterRangeAttribute
            
        case .visibleChildren:
            return kAXVisibleChildrenAttribute
            
        case .visibleColumns:
            return kAXVisibleColumnsAttribute
            
        case .window:
            return kAXWindowAttribute
            
        case .yearField:
            return kAXYearFieldAttribute
            
        case .zoomButton:
            return kAXZoomButtonAttribute
        }
    }
}

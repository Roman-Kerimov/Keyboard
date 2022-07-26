//
//  KeyView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-20.
//

import SwiftUI
import KeyboardModule

struct KeyView: View {
    @EnvironmentObject var settings: Settings
    @EnvironmentObject var keyboardController: KeyboardViewController
    @EnvironmentObject var keyboard: Keyboard
    
    @ObservedObject var key: Key
    
    private var returnKeyType: UIReturnKeyType? {
        return key != .enter ? nil : Keyboard.default.delegate?.returnKeyType ?? .default
    }
    
    private var isServiceKey: Bool {
        return key.label.count > 1 && key != .space
    }
    
    private var isSpecialReturnType: Bool {
        return key == .enter
            && returnKeyType != .default
            && returnKeyType != .next
            && returnKeyType != .continue
    }
    
    private var backgroundColor: Color {
        !key.isEnabled
            ? Color(uiColor: .quaternaryLabel)
            : key.isHighlighted != isServiceKey && isSpecialReturnType
                ? .accentColor
                : key.isHighlighted == isServiceKey && !isSpecialReturnType
                    ? .control
                    : Color(uiColor: .quaternaryLabel)
    }
    
    private var mainLabelColor: Color {
        !key.isEnabled
            ? .disabledControlText
            : key.isHighlighted != isServiceKey && isSpecialReturnType
                ? .alternateSelectedControlText
                : .primary
    }
    
    private var mainLabelFont: Font {
        [.space, .enter, .delete].contains(key) ? nameLabelFont : characterLabelFont
    }
    
    private var characterLabelFont: Font {
        .custom(.characterFontName, size: keyboardController.keyLabelFontSize)
    }
    
    private var nameLabelFont: Font {
        .system(size: keyboardController.keyNameLabelFontSize)
    }
    
    @State private var gestureStartPoint: CGPoint!
    @State private var startPointSpeed: CGFloat = 0
    @State private var previousTime: TimeInterval = 0
    @State private var previousDistance: CGFloat = 0
    
    var body: some View {
        backgroundColor
            .cornerRadius(keyboardController.keyCornerRadius)
            .padding(keyboardController.keySpacing/2)
            .overlay {
                ZStack {
                    switch key {
                    case .settings:
                        Image(systemName: "slider.horizontal.3")
                        
                    case .nextKeyboard:
                        Image(systemName: "globe")
                        
                    case .dismissKeyboard:
                        Image(systemName: "keyboard.chevron.compact.down")
                        
                    default:
                        Text(returnKeyType?.localizedString ?? key.mainLabel)
                            .font(mainLabelFont)
                            .foregroundColor(mainLabelColor)
                            .lineLimit(2)
                    }
                    
                    if key.isHighlighted == isServiceKey {
                        Group {
                            VStack {
                                Text(key.shiftUpLabel)
                                    .frame(maxWidth: .infinity, alignment: key == .space ? .top : .topLeading)
                                
                                Spacer(minLength: 0)
                                
                                Text(key.shiftDownLabel)
                                    .minimumScaleFactor(0.5)
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, alignment: key == .space ? .bottom : .bottomTrailing)
                            }
                            .font(.custom(.characterFontName, size: keyboardController.keyNameLabelFontSize))
                            
                            HStack(spacing: 0) {
                                Text(key.shiftLeftLabel)
                                
                                Spacer(minLength: 0)
                                
                                Text(key.shiftRightLabel)
                            }
                            .font(nameLabelFont)
                        }
                        .padding(.vertical, keyboardController.verticalShiftLabelIndent)
                        .padding(.horizontal, keyboardController.horizontalShiftLabelIndent)
                    }
                }
            }
            .foregroundColor(.primary)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { dragGesture in
                        if gestureStartPoint == nil {
                            keyboard.shiftDirections = []
                            
                            key.isHighlighted = true
                            
                            gestureStartPoint = dragGesture.location
                            startPointSpeed = 0
                            
                            previousTime = Date.timeIntervalSinceReferenceDate
                            previousDistance = 0
                            
                            Keyboard.default.down(key: key)
                        }
                        
                        let gestureCurrentPoint = dragGesture.location
                        
                        let offsetPoint = CGPoint(
                            x: gestureCurrentPoint.x - gestureStartPoint.x,
                            y: gestureCurrentPoint.y - gestureStartPoint.y
                        )
                        
                        
                        let distance = hypot(offsetPoint.x, offsetPoint.y)
                        let threshold = keyboardController.keySize.height / 2
                        let direction = (atan2(-offsetPoint.y, offsetPoint.x) / .pi * 4).rounded() / 4
                        
                        let currentTime = Date.timeIntervalSinceReferenceDate
                        let speed = (distance - previousDistance) / .init(currentTime - previousTime)
                        previousTime = currentTime
                        previousDistance = distance
                        
                        let shiftDirection: Keyboard.ShiftDirection
                        
                        switch direction {
                        case -0.75:
                            shiftDirection = .downLeft
                        case -0.5:
                            shiftDirection = .down
                        case -0.25:
                            shiftDirection = .downRight
                        case 0:
                            shiftDirection = .right
                        case 0.25:
                            shiftDirection = .upRight
                        case 0.5:
                            shiftDirection = .up
                        case 0.75:
                            shiftDirection = .upLeft
                        default:
                            shiftDirection = .left
                        }
                        
                        if keyboard.shiftDirections.last == shiftDirection  || startPointSpeed > 300 {
                            gestureStartPoint = dragGesture.location
                            previousDistance = 0
                            startPointSpeed = speed
                        } else if distance > threshold {
                            keyboard.shiftDirections.append(shiftDirection)
                            keyboard.shift(direction: shiftDirection)
                        }
                    }
                    .onEnded { dragGesture in
                        keyboard.up(key: key)
                        key.isHighlighted = false
                        
                        gestureStartPoint = nil
                    }
            )
            .overlay {
                switch key {
                case .nextKeyboard:
                    UIButtonView(
                        target: keyboardController,
                        action: #selector(keyboardController.handleInputModeList(from:with:)),
                        controlEvents: .allTouchEvents
                    )
                    
                case .dismissKeyboard:
                    UIButtonView(
                        target: keyboardController,
                        action: #selector(keyboardController.dismissKeyboard),
                        controlEvents: .allTouchEvents
                    )
                    
                default:
                    EmptyView()
                }
            }
    }
}

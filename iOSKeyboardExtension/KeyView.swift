//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class KeyView: UIButton {
    
    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        super.addTarget(target, action: action, for: controlEvents)
        
        removeGestureRecognizer(longPressGestureRecognizer)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var colorScheme: KeyboardColorScheme = .default {
        didSet {
            backgroundView.backgroundColor = colorScheme.keyColor
            
            label.textColor = colorScheme.labelColor
            shiftUpLabel.textColor = colorScheme.shiftLabelColor
            shiftDownLabel.textColor = colorScheme.shiftLabelColor
            shiftLeftLabel.textColor = colorScheme.shiftLabelColor
            shiftRightLabel.textColor = colorScheme.shiftLabelColor
            
            backgroundView.layer.borderColor = colorScheme.borderColor.cgColor
        }
    }
    
    var maxKeyWidth: CGFloat!
    
    func configure(maxKeyWidth: CGFloat, keySize: CGSize, minimalScreenSize: CGSize, sizeInKeysForVerticalMode: CGSize) {
        self.maxKeyWidth = maxKeyWidth
        
        let keySpace = keySize.width * 0.1
        
        backgroundView.layer.cornerRadius = keySpace
        
        let keyEdgeInset = keySpace / 2
        
        layoutMargins = UIEdgeInsets(top: keyEdgeInset, left: keyEdgeInset, bottom: keyEdgeInset, right: keyEdgeInset)
        
        let verticalShiftLabelIndent = keySpace * 1/4
        let horizontalShiftLabelIndent = keySpace * 1/2

        backgroundView.layoutMargins = UIEdgeInsets(top: verticalShiftLabelIndent, left: horizontalShiftLabelIndent, bottom: verticalShiftLabelIndent, right: horizontalShiftLabelIndent)
        
        let keyWidthForCalculateFontSize = max(
            keySize.width,
            minimalScreenSize.width / sizeInKeysForVerticalMode.width
        )
        
        let labelFontSize = keyWidthForCalculateFontSize * 6/15
        label.font = label.font.withSize(labelFontSize)
        
        let deleteLabelFontSize = labelFontSize/1.8
    
        let decreaseCoefficientWeight: CGFloat = 0.2
        let decreaseCoefficientForNarrowKeys =
            (keySize.width/keyWidthForCalculateFontSize + decreaseCoefficientWeight)
            / (1 + decreaseCoefficientWeight)
        
        let shiftLabelFont = UIFont.systemFont(
            ofSize: deleteLabelFontSize * decreaseCoefficientForNarrowKeys
        )
        shiftUpLabel.font = shiftLabelFont
        shiftDownLabel.font = shiftLabelFont
        shiftLeftLabel.font = shiftLabelFont
        shiftRightLabel.font = shiftLabelFont
        
        guard let specialKey = self.specialKey else {
            return
        }
        
        switch specialKey {
        case .delete, .return:
            label.font = label.font.withSize(deleteLabelFontSize)
            
        case .dismissKeyboard:
            label.font = label.font.withSize(deleteLabelFontSize * 1.2)
            
        case .nextKeyboard:
            label.font = label.font.withSize(deleteLabelFontSize * 1.5)
            centerXLabelConstraint.constant = label.font.pointSize * 0.02
            centerYLabelConstraint.constant = label.font.pointSize * 0.05
            
        case .settings:
            label.font = label.font.withSize(deleteLabelFontSize * 2.5)
            centerXLabelConstraint.constant = label.font.pointSize * 0.025
            
        default:
            break
        }
    }
    
    var centerXLabelConstraint: NSLayoutConstraint!
    var centerYLabelConstraint: NSLayoutConstraint!
    
    let mainLabel: String
    
    let label = UILabel()
    let shiftUpLabel = ShiftLabel()
    let shiftDownLabel = ShiftLabel()
    
    let shiftLeftLabel = ShiftLabel()
    let shiftRightLabel = ShiftLabel()
    
    var backgroundView: UIView!
    
    convenience init(key: SpecialKey) {
        self.init(label: key.label)
        
        if key == .nextKeyboard || key == .dismissKeyboard {
            label.font = UIFont(name: "FiraSans", size: 1)
        }
    }
    
    init(label: String, shiftDownLabel: String = "") {
        mainLabel = label
        super.init(frame: CGRect())
        
        // It is for activation of touch events
        backgroundColor = UIColor.white.withAlphaComponent(0.001)
        
        self.label.numberOfLines = 3
        
        backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.isExclusiveTouch = false
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor).isActive = true
        
        addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.text = mainLabel
        self.label.textAlignment = .center
        self.label.adjustsFontSizeToFitWidth = true
        
        self.label.baselineAdjustment = .alignCenters
        
        self.label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        centerXLabelConstraint = self.label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        centerXLabelConstraint.isActive = true
        
        centerYLabelConstraint = self.label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centerYLabelConstraint.isActive = true
        
        addSubview(self.shiftUpLabel)
        addSubview(self.shiftDownLabel)
        
        self.shiftDownLabel.bottomAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.bottomAnchor).isActive = true
        self.shiftUpLabel.text = KeyboardLayout.shiftUpDictionary[label]
        
        if specialKey == .space {
            self.shiftUpLabel.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor).isActive = true
            self.shiftUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
            self.shiftDownLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            self.shiftDownLabel.text = SpecialKey.space.label
            
            addSubview(shiftLeftLabel)
            shiftLeftLabel.leftAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.leftAnchor).isActive = true
            shiftLeftLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            shiftLeftLabel.text = SpecialKey.union.label
            
            addSubview(shiftRightLabel)
            shiftRightLabel.rightAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.rightAnchor).isActive = true
            shiftRightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            shiftRightLabel.text = SpecialKey.tab.label
        }
        else {
            self.shiftUpLabel.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor).isActive = true
            self.shiftUpLabel.leftAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.leftAnchor).isActive = true
            
            self.shiftDownLabel.rightAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.rightAnchor).isActive = true
            self.shiftDownLabel.text = shiftDownLabel
        }
        
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        addGestureRecognizer(longPressGestureRecognizer)
        
        longPressGestureRecognizer.minimumPressDuration = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        mainLabel = ""
        super.init(coder: aDecoder)
    }
    
    var longPressGestureRecognizer: UILongPressGestureRecognizer!

    var gestureStartPoint: CGPoint!
    
    var autorepeatThread: Thread?
    
    func longPressGestureAction(gesture: UIGestureRecognizer) {
        
        switch gesture.state {
            
        case .began:
            
            backgroundView.backgroundColor = tintColor
            label.textColor = colorScheme.activeLabelColor
            shiftUpLabel.isHidden = true
            shiftDownLabel.isHidden = true
            shiftLeftLabel.isHidden = true
            shiftRightLabel.isHidden = true
            
            gestureStartPoint = gesture.location(in: self)
            
            if specialKey == .delete {
                KeyboardViewController.shared.keyAction(label: self.label.text!)
                
                autorepeatThread = Thread(block: {
                    let thread = self.autorepeatThread!
                    
                    Thread.sleep(forTimeInterval: 0.5)
                    
                    while thread.isCancelled == false {
                        KeyboardViewController.shared.keyAction(label: self.label.text!)
                        Thread.sleep(forTimeInterval: 0.1)
                    }
                    
                    Thread.exit()
                })
                
            	autorepeatThread?.start()
            }
            
        case .ended:
            
            autorepeatThread?.cancel()
            
            if specialKey != .delete {
                KeyboardViewController.shared.keyAction(label: self.label.text!)
            }
            
            backgroundView.backgroundColor = colorScheme.keyColor
            label.textColor = colorScheme.labelColor
            shiftUpLabel.isHidden = false
            shiftDownLabel.isHidden = false
            shiftLeftLabel.isHidden = false
            shiftRightLabel.isHidden = false
            
            label.text = mainLabel
            
        default:
            
            let gestureCurrentPoint = gesture.location(in: self)
            
            let offset = CGPoint(
                x: gestureCurrentPoint.x - gestureStartPoint.x,
                y: gestureCurrentPoint.y - gestureStartPoint.y
            )
            
            let threshold = CGPoint(x: min(maxKeyWidth / 2, bounds.size.width / 4), y: bounds.size.height / 4)
            
            let isUpShift = offset.y < -threshold.y
            let isDownShift = offset.y > threshold.y
            let isLeftShift = offset.x < -threshold.x
            let isRightShift = offset.x > threshold.x
            
            if isLeftShift && shiftLeftLabel.text != nil {
                label.text = shiftLeftLabel.text
            }
            else if isRightShift && shiftRightLabel.text != nil {
                label.text = shiftRightLabel.text
            }
            else if isUpShift {
                if shiftUpLabel.text != nil {
                    label.text = shiftUpLabel.text
                }
                else if specialKey == nil {
                    label.text = mainLabel.uppercased()
                }
            }
            else if isDownShift && isRightShift && shiftDownLabel.text != "" {
                label.text = shiftDownLabel.text?.components(separatedBy: " ").last
            }
            else if isDownShift && shiftDownLabel.text != "" {
                label.text = shiftDownLabel.text?.components(separatedBy: " ").first
            }
            else {
                label.text = mainLabel
            }
        }
    }
    
    var specialKey: SpecialKey? {
        guard let label = label.text else {
            return nil
        }
        
        return SpecialKey(rawValue: label)
    }
}

internal enum SpecialKey: String {
    var label: String {
        return rawValue
    }
    
    case delete = "delete"
    case space = " "
    case `return` = "return"
    case tab = "tab"
    case union = "union"
    case nextKeyboard = "🌐"
    case dismissKeyboard = "\n⌨\nˇ"
    case settings = "𑁔"
    case horizontalMode = "▄▄"
    case verticalMode = "▝█▖"
}

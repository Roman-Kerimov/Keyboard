//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class KeyView: UIView {

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
    
    static var allKeys: [KeyView] = []
    
    class func configure(for keyboardView: KeyboardView) {
        for key in allKeys {
            let width = keyboardView.keySize.width
            
            let keySpace = width * 0.1
            
        	key.backgroundView.layer.cornerRadius = keySpace
            
            let keyEdgeInset = keySpace / 2
            
            key.layoutMargins = UIEdgeInsets(top: keyEdgeInset, left: keyEdgeInset, bottom: keyEdgeInset, right: keyEdgeInset)
            
            let verticalShiftLabelIndent = keySpace * 1/4
            let horizontalShiftLabelIndent = keySpace * 1/2

            key.backgroundView.layoutMargins = UIEdgeInsets(top: verticalShiftLabelIndent, left: horizontalShiftLabelIndent, bottom: verticalShiftLabelIndent, right: horizontalShiftLabelIndent)
            
            let keyWidthForCalculateFontSize = max(
                keyboardView.keySize.width,
                keyboardView.minimalScreenSize.width / keyboardView.sizeInKeysForVerticalMode.width
            )
            
            let labelFontSize = keyWidthForCalculateFontSize * 6/15
            key.label.font = UIFont.systemFont(ofSize: labelFontSize)
            
            let shiftLabelFont = UIFont.systemFont(ofSize: labelFontSize/1.8)
            key.shiftUpLabel.font = shiftLabelFont
            key.shiftDownLabel.font = shiftLabelFont
            key.shiftLeftLabel.font = shiftLabelFont
            key.shiftRightLabel.font = shiftLabelFont
            
            if key.mainLabel == deleteLabel {
                key.label.font = shiftLabelFont
            }
        }
    }
    
    var centerYLabelConstraint: NSLayoutConstraint!
    
    let mainLabel: String
    
    let label = UILabel()
    let shiftUpLabel = ShiftLabel()
    let shiftDownLabel = ShiftLabel()
    
    let shiftLeftLabel = ShiftLabel()
    let shiftRightLabel = ShiftLabel()
    
    var backgroundView: UIView!
    
    init(label: String, shiftDownLabel: String = "") {
        mainLabel = label
        super.init(frame: CGRect())
        
        KeyView.allKeys.append(self)
        
        backgroundView = UIView()
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
        
        self.label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        centerYLabelConstraint = self.label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centerYLabelConstraint.isActive = true
        
        addSubview(self.shiftUpLabel)
        addSubview(self.shiftDownLabel)
        
        self.shiftDownLabel.bottomAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.bottomAnchor).isActive = true
        self.shiftUpLabel.text = KeyboardLayout.shiftUpDictionary[label]
        
        if mainLabel == spaceLabel {
            self.shiftUpLabel.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor).isActive = true
            self.shiftUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            
            self.shiftDownLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            self.shiftDownLabel.text = returnLabel
            
            addSubview(shiftLeftLabel)
            shiftLeftLabel.leftAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.leftAnchor).isActive = true
            shiftLeftLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            shiftLeftLabel.text = unionLabel
            
            addSubview(shiftRightLabel)
            shiftRightLabel.rightAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.rightAnchor).isActive = true
            shiftRightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            shiftRightLabel.text = tabLabel
        }
        else {
            self.shiftUpLabel.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor).isActive = true
            self.shiftUpLabel.leftAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.leftAnchor).isActive = true
            
            self.shiftDownLabel.rightAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.rightAnchor).isActive = true
            self.shiftDownLabel.text = shiftDownLabel
        }
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        addGestureRecognizer(longPressGestureRecognizer)
        
        longPressGestureRecognizer.minimumPressDuration = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        mainLabel = ""
        super.init(coder: aDecoder)
    }
    
    var action: ((String) -> Void)?

    var gestureStartPoint: CGPoint!
    
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
            
        case .ended:
            
            action?(label.text!)
            
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
            
            let threshold = CGPoint(x: bounds.size.width / 4, y: bounds.size.height / 4)
            
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
                else if isCharacterLabel {
                    label.text = mainLabel.uppercased()
                }
            }
            else if isDownShift && isRightShift {
                label.text = shiftDownLabel.text?.components(separatedBy: " ").last
            }
            else if isDownShift {
                label.text = shiftDownLabel.text?.components(separatedBy: " ").first
            }
            else {
                label.text = mainLabel
            }
        }
    }
    
    var isCharacterLabel: Bool {
        return mainLabel != deleteLabel
            && mainLabel != spaceLabel
        	&& mainLabel != returnLabel
        	&& mainLabel != tabLabel
        	&& mainLabel != unionLabel
    }
}

let deleteLabel = "delete"
let spaceLabel = " "
let returnLabel = "return"
let tabLabel = "tab"
let unionLabel = "union"

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
            tintColor = colorScheme.labelColor
            shiftUpLabel.textColor = colorScheme.shiftLabelColor
            shiftDownLabel.textColor = colorScheme.shiftLabelColor
            shiftLeftLabel.textColor = colorScheme.shiftLabelColor
            shiftRightLabel.textColor = colorScheme.shiftLabelColor
            
            backgroundView.layer.borderColor = colorScheme.borderColor.cgColor
        }
    }
    
    public var mainLabel: String {
        didSet {
            label.text = mainLabel
        }
    }
    
    private var labelFileName: String {
        return "Labels_\(mainLabel)"
    }
    
    let label: ShiftLabel = .init()
    let imageLabelView: UIImageView = .init()
    let shiftUpLabel = ShiftLabel()
    public let shiftDownLabel = ShiftLabel()
    
    let shiftLeftLabel = ShiftLabel()
    let shiftRightLabel = ShiftLabel()
    
    var backgroundView: UIView!
    
    convenience init(key: SpecialKey) {
        self.init(label: key.label)
        
        if key == .nextKeyboard || key == .dismissKeyboard {
            //label.font =
        }
    }
    
    private var highlightColor: UIColor!
    
    override internal var isHighlighted: Bool {
        didSet {
            super.isHighlighted = isHighlighted
            
            if isHighlighted {
                
                backgroundView.backgroundColor = highlightColor
                label.textColor = colorScheme.activeLabelColor
                shiftUpLabel.isHidden = true
                shiftDownLabel.isHidden = true
                shiftLeftLabel.isHidden = true
                shiftRightLabel.isHidden = true
            }
            else {
                
                backgroundView.backgroundColor = colorScheme.keyColor
                label.textColor = colorScheme.labelColor
                shiftUpLabel.isHidden = false
                shiftDownLabel.isHidden = false
                shiftLeftLabel.isHidden = false
                shiftRightLabel.isHidden = false
            }
        }
    }
    
    init(label: String = "", shiftDownLabel: String = "") {
        mainLabel = label
        super.init(frame: CGRect())
        
        // It is for activation of touch events
        backgroundColor = .touchableClear
        
        highlightColor = tintColor
        
        backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.isExclusiveTouch = false
        addSubview(backgroundView)
        
        addSubview(self.label)
        self.label.text = mainLabel
        self.label.textAlignment = .center
        self.label.adjustsFontSizeToFitWidth = true
        
        self.label.baselineAdjustment = .alignCenters
        
        
        addSubview(self.shiftUpLabel)
        addSubview(self.shiftDownLabel)
        
        if specialKey == .space {
            self.shiftDownLabel.text = SpecialKey.space.label
            
            addSubview(shiftLeftLabel)
            shiftLeftLabel.text = SpecialKey.union.label
            
            addSubview(shiftRightLabel)
            shiftRightLabel.text = SpecialKey.tab.label
        }
        else {
            self.shiftDownLabel.text = shiftDownLabel
        }
        
        addSubview(imageLabelView)
        
        if let imageLabel: UIImage = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: 1, for: self) {
            imageLabelView.image = imageLabel
            self.label.isHidden = true
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
    
    func configure(size: CGSize, labelFontSize: CGFloat) {
        frame.size = size
        
        label.font = label.font.withSize(labelFontSize)
        
        let shiftLabelFont = UIFont.systemFont(ofSize: labelFontSize/1.8)
        shiftUpLabel.font = shiftLabelFont
        shiftDownLabel.font = shiftLabelFont
        shiftLeftLabel.font = shiftLabelFont
        shiftRightLabel.font = shiftLabelFont
        
        if let specialKey = self.specialKey {
            switch specialKey {
            case .delete, .return:
                label.font = label.font.withSize(shiftLabelFont.pointSize)
                
            case .settings:
                label.font = label.font.withSize(shiftLabelFont.pointSize * 2.5)
                
            default:
                break
            }
            
            if imageLabelView.image != nil {
                imageLabelView.image = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: labelFontSize/24, for: self)?.withRenderingMode(.alwaysTemplate)
            }
        }
        
        let keySpace = size.height * 0.1
        
        backgroundView.layer.cornerRadius = keySpace
        
        let keyEdgeInset = keySpace / 2
        
        backgroundView.frame = frame.insetBy(dx: keyEdgeInset, dy: keyEdgeInset)
        backgroundView.frame.origin = .init(x: keyEdgeInset, y: keyEdgeInset)
        
        let verticalShiftLabelIndent = keySpace * 2.2
        let horizontalShiftLabelIndent = keySpace * 0.5
        
        label.center = backgroundView.center
        
        shiftUpLabel.center.y = verticalShiftLabelIndent
        shiftDownLabel.center.y = frame.height - verticalShiftLabelIndent

        if specialKey == .space {
            shiftUpLabel.center.x = backgroundView.center.x
            shiftDownLabel.center.x = backgroundView.center.x
        }
        else {
            shiftUpLabel.frame.origin.x = horizontalShiftLabelIndent
            shiftDownLabel.frame.origin.x = frame.width - shiftDownLabel.frame.width - horizontalShiftLabelIndent
        }

        shiftLeftLabel.frame.origin.x = horizontalShiftLabelIndent
        shiftLeftLabel.center.y = frame.midY
        
        shiftRightLabel.frame.origin.x = frame.maxX - shiftRightLabel.frame.width - horizontalShiftLabelIndent
        shiftRightLabel.center.y = frame.midY
        
        imageLabelView.frame.size = imageLabelView.intrinsicContentSize
        imageLabelView.center = .init(x: frame.midX, y: frame.midY)
    }
    
    var longPressGestureRecognizer: UILongPressGestureRecognizer!

    var gestureStartPoint: CGPoint!
    
    var autorepeatThread: Thread?
    
    func longPressGestureAction(gesture: UIGestureRecognizer) {
        
        switch gesture.state {
            
        case .began:
            
            isHighlighted = true
            
            gestureStartPoint = gesture.location(in: self)
            
            if specialKey == .delete {
                KeyboardViewController.shared.keyAction(label: self.label.text!)
                KeyboardViewController.shared.updateDocumentContext()
                
                autorepeatThread = Thread(block: {
                    let thread = self.autorepeatThread!
                    
                    Thread.sleep(forTimeInterval: 0.5)
                    
                    while thread.isCancelled == false {
                        
                        OperationQueue.main.addOperation {
                            KeyboardViewController.shared.keyAction(label: self.label.text!)
                            KeyboardViewController.shared.updateDocumentContext()
                        }
                        
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
                KeyboardViewController.shared.updateDocumentContext()
            }
            
            isHighlighted = false
            
            label.text = mainLabel
            
        default:
            
            let gestureCurrentPoint = gesture.location(in: self)
            
            let offset = CGPoint(
                x: gestureCurrentPoint.x - gestureStartPoint.x,
                y: gestureCurrentPoint.y - gestureStartPoint.y
            )
            
            let threshold = CGPoint(x: bounds.size.height / 2, y: bounds.size.height / 4)
            
            let isShiftUp = offset.y < -threshold.y
            let isShiftDown = offset.y > threshold.y
            let isLeftShift = offset.x < -threshold.x
            let isRightShift = offset.x > threshold.x
            
            if isLeftShift && shiftLeftLabel.text != nil {
                keyState = .shiftLeft
            }
            else if isRightShift && shiftRightLabel.text != nil {
                keyState = .shiftRight
            }
            else if isShiftUp {
                keyState = .shiftUp
            }
            else if isShiftDown && isRightShift && shiftDownLabel.text != "" {
                keyState = .shiftDownRight
            }
            else if isShiftDown && shiftDownLabel.text != "" {
                keyState = .shiftDown
            }
            else {
                keyState = .tap
            }
        }
    }
    
    var specialKey: SpecialKey? {
        guard let label = label.text else {
            return nil
        }
        
        return SpecialKey(rawValue: label)
    }
    
    var keyState: KeyState = .default {
        didSet {
            isHighlighted = true
            
            switch keyState {
            case .default:
                label.text = mainLabel
                isHighlighted = false
            case .tap:
                label.text = mainLabel
                
            case .shiftUp:
                if shiftUpLabel.text != nil {
                    label.text = shiftUpLabel.text
                }
                else if specialKey == nil {
                    label.text = mainLabel.uppercased()
                }
                
            case .shiftDown:
                label.text = String(shiftDownLabel.text!.characters.first!)
                
            case .shiftDownRight:
                label.text = String(shiftDownLabel.text!.characters.last!)
                
            case .shiftLeft:
                label.text = shiftLeftLabel.text
                
            case .shiftRight:
                label.text = shiftRightLabel.text
            }
        }
    }
}
    
public enum KeyState {
    case `default`, tap, shiftUp, shiftDown, shiftLeft, shiftRight, shiftDownRight
}

public enum SpecialKey: String {
    var label: String {
        return rawValue
    }
    
    case delete = "delete"
    case removeCharacter = "removeCharacter"
    case space = " "
    case `return` = "return"
    case tab = "tab"
    case union = "union"
    case nextKeyboard = "NextKeyboard"
    case dismissKeyboard = "HideKeyboard"
    case settings = "Settings"
    case horizontalMode = "▄▄"
    case verticalMode = "▝█▖"
}

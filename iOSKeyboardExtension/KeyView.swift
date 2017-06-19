//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class KeyView: UIButton, ConfigurableView {
    
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
            
            mainLabelView.textColor = colorScheme.labelColor
            tintColor = colorScheme.labelColor
            shiftUpLabelView.textColor = colorScheme.shiftLabelColor
            shiftDownLabelView.textColor = colorScheme.shiftLabelColor
            shiftLeftLabelView.textColor = colorScheme.shiftLabelColor
            shiftRightLabelView.textColor = colorScheme.shiftLabelColor
            
            backgroundView.layer.borderColor = colorScheme.borderColor.cgColor
        }
    }
    
    public var mainLabel: String = "" {
        didSet {
            mainLabelView.text = mainLabel
        }
    }
    
    public var shiftDownLabel: String = "" {
        didSet {
            shiftDownLabelView.text = shiftDownLabel
        }
    }
    
    public var shiftUpLabel: String = "" {
        didSet {
            shiftUpLabelView.text = shiftUpLabel
        }
    }
    
    private var labelFileName: String {
        return "Labels_\(mainLabel)"
    }
    
    private let mainLabelView: LabelView = .init()
    private let imageLabelView: UIImageView = .init()
    private let shiftUpLabelView: LabelView = .init()
    private let shiftDownLabelView: LabelView = .init()
    
    private let shiftLeftLabelView: LabelView = .init()
    private let shiftRightLabelView: LabelView = .init()
    
    private var backgroundView: UIView!
    
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
                mainLabelView.textColor = colorScheme.activeLabelColor
                shiftUpLabelView.isHidden = true
                shiftDownLabelView.isHidden = true
                shiftLeftLabelView.isHidden = true
                shiftRightLabelView.isHidden = true
            }
            else {
                
                backgroundView.backgroundColor = colorScheme.keyColor
                mainLabelView.textColor = colorScheme.labelColor
                shiftUpLabelView.isHidden = false
                shiftDownLabelView.isHidden = false
                shiftLeftLabelView.isHidden = false
                shiftRightLabelView.isHidden = false
            }
        }
    }
    
    init(label: String = "", shiftDownLabel: String = "") {
        super.init(frame: CGRect())
        
        mainLabel = label
        shiftUpLabelView.text = KeyboardLayout.shiftUpDictionary[label]
        
        // It is for activation of touch events
        backgroundColor = .touchableClear
        
        highlightColor = tintColor
        
        backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.isExclusiveTouch = false
        addSubview(backgroundView)
        
        addSubview(mainLabelView)
        mainLabelView.text = mainLabel
        
        addSubview(shiftUpLabelView)
        addSubview(shiftDownLabelView)
        
        if specialKey == .space {
            shiftDownLabelView.text = SpecialKey.space.label
            
            addSubview(shiftLeftLabelView)
            shiftLeftLabelView.text = SpecialKey.union.label
            
            addSubview(shiftRightLabelView)
            shiftRightLabelView.text = SpecialKey.tab.label
        }
        else {
            shiftDownLabelView.text = shiftDownLabel
        }
        
        addSubview(imageLabelView)
        
        if let imageLabel: UIImage = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: 1, for: self) {
            imageLabelView.image = imageLabel
            mainLabelView.isHidden = true
        }
        
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        addGestureRecognizer(longPressGestureRecognizer)
        
        longPressGestureRecognizer.minimumPressDuration = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var baseFontSize: CGFloat = 0
    
    public func configure() {
        configure(size: frame.size, labelFontSize: baseFontSize)
    }
    
    public func configure(size: CGSize, labelFontSize: CGFloat) {
        frame.size = size
        baseFontSize = labelFontSize
        
        mainLabelView.font = mainLabelView.font.withSize(baseFontSize)
        
        let shiftLabelFont = UIFont.systemFont(ofSize: labelFontSize/1.8)
        shiftUpLabelView.font = shiftLabelFont
        shiftDownLabelView.font = shiftLabelFont
        shiftLeftLabelView.font = shiftLabelFont
        shiftRightLabelView.font = shiftLabelFont
        
        if let specialKey = self.specialKey {
            switch specialKey {
            case .delete, .return:
                mainLabelView.font = mainLabelView.font.withSize(shiftLabelFont.pointSize)
                
            case .settings:
                mainLabelView.font = mainLabelView.font.withSize(shiftLabelFont.pointSize * 2.5)
                
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
        
        mainLabelView.center = backgroundView.center
        
        shiftUpLabelView.center.y = verticalShiftLabelIndent
        shiftDownLabelView.center.y = frame.height - verticalShiftLabelIndent

        if specialKey == .space {
            shiftUpLabelView.center.x = backgroundView.center.x
            shiftDownLabelView.center.x = backgroundView.center.x
        }
        else {
            shiftUpLabelView.frame.origin.x = horizontalShiftLabelIndent
            shiftDownLabelView.frame.origin.x = frame.width - shiftDownLabelView.frame.width - horizontalShiftLabelIndent
        }

        shiftLeftLabelView.frame.origin.x = horizontalShiftLabelIndent
        shiftLeftLabelView.center.y = backgroundView.center.y
        
        shiftRightLabelView.frame.origin.x = frame.width - shiftRightLabelView.frame.width - horizontalShiftLabelIndent
        shiftRightLabelView.center.y = backgroundView.center.y
        
        imageLabelView.frame.size = imageLabelView.intrinsicContentSize
        imageLabelView.center = backgroundView.center
    }
    
    var longPressGestureRecognizer: UILongPressGestureRecognizer!

    var gestureStartPoint: CGPoint!
    
    var autorepeatThread: Thread?
    
    @objc func longPressGestureAction(gesture: UIGestureRecognizer) {
        
        KeyboardViewController.shared.keyboardView.unicodeCollectionView.isHiddenUnicodeNames = true
        
        switch gesture.state {
            
        case .began:
            
            isHighlighted = true
            
            gestureStartPoint = gesture.location(in: self)
            
            if specialKey == .delete {
                KeyboardViewController.shared.keyAction(label: mainLabelView.text!)
                KeyboardViewController.shared.updateDocumentContext()
                
                autorepeatThread = Thread(block: {
                    let thread = self.autorepeatThread!
                    
                    Thread.sleep(forTimeInterval: 0.5)
                    
                    while thread.isCancelled == false {
                        
                        OperationQueue.main.addOperation {
                            KeyboardViewController.shared.keyAction(label: self.mainLabelView.text!)
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
                KeyboardViewController.shared.keyAction(label: mainLabelView.text!)
                KeyboardViewController.shared.updateDocumentContext()
            }
            
            isHighlighted = false
            
            mainLabelView.text = mainLabel
            
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
            
            if isLeftShift && shiftLeftLabelView.text != nil {
                keyState = .shiftLeft
            }
            else if isRightShift && shiftRightLabelView.text != nil {
                keyState = .shiftRight
            }
            else if isShiftUp {
                keyState = .shiftUp
            }
            else if isShiftDown && isRightShift && shiftDownLabelView.text != "" {
                keyState = .shiftDownRight
            }
            else if isShiftDown && shiftDownLabelView.text != "" {
                keyState = .shiftDown
            }
            else {
                keyState = .tap
            }
        }
    }
    
    var specialKey: SpecialKey? {
        guard let label = mainLabelView.text else {
            return nil
        }
        
        return SpecialKey(rawValue: label)
    }
    
    var keyState: KeyState = .default {
        didSet {
            isHighlighted = true
            
            switch keyState {
            case .default:
                mainLabelView.text = mainLabel
                isHighlighted = false
            case .tap:
                mainLabelView.text = mainLabel
                
            case .shiftUp:
                if shiftUpLabelView.text != nil && shiftUpLabelView.text != "" {
                    mainLabelView.text = shiftUpLabelView.text
                }
                else if specialKey == nil {
                    mainLabelView.text = mainLabel.uppercased()
                }
                
            case .shiftDown:
                mainLabelView.text = String(shiftDownLabelView.text!.characters.first!)
                
            case .shiftDownRight:
                mainLabelView.text = String(shiftDownLabelView.text!.characters.last!)
                
            case .shiftLeft:
                mainLabelView.text = shiftLeftLabelView.text
                
            case .shiftRight:
                mainLabelView.text = shiftRightLabelView.text
            }
            
            mainLabelView.center = backgroundView.center
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

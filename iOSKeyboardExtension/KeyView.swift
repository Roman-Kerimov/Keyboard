//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class KeyView: UIButton, ConfigurableView {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        guard let returnKeyType = returnKeyType else {
            return
        }
        
        switch returnKeyType {
            
        case .default:
            mainLabelView.text = SpecialKey.return.label
        case .go:
            mainLabelView.text = GO.string
        case .join:
            mainLabelView.text = JOIN.string
        case .next:
            mainLabelView.text = NEXT.string
        case .route:
            mainLabelView.text = ROUTE.string
        case .search, .google, .yahoo:
            mainLabelView.text = SEARCH.string
        case .send:
            mainLabelView.text = SEND.string
        case .done:
            mainLabelView.text = DONE.string
        case .emergencyCall:
            mainLabelView.text = EMERGENCY_CALL.string
        case .continue:
            mainLabelView.text = CONTINUE.string
        }
    }
    
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
            shiftUpLabelView.textColor = colorScheme.shiftLabelColor
            shiftDownLabelView.textColor = colorScheme.shiftLabelColor
            shiftLeftLabelView.textColor = colorScheme.shiftLabelColor
            shiftRightLabelView.textColor = colorScheme.shiftLabelColor
            
            updateLocalizedStrings()
            isHighlighted = false
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
    
    private var returnKeyType: UIReturnKeyType? {
        if specialKey == .return {
            #if TARGET_INTERFACE_BUILDER
                return .default
            #else
                return KeyboardViewController.shared.textDocumentProxy.returnKeyType
            #endif
        }
        else {
            return nil
        }
    }
    
    private var isServiceKey: Bool {
        return specialKey != nil && specialKey != .space && returnKeyType != .default
    }
    
    private var isSpecialReturnType: Bool {
        return specialKey == .return
            && returnKeyType != .default
            && returnKeyType != .next
            && returnKeyType != .continue
    }
    
    override internal var isHighlighted: Bool {
        didSet {
            super.isHighlighted = isHighlighted
            
            backgroundView.backgroundColor = colorScheme.serviceKeyColor
            mainLabelView.textColor = colorScheme.labelColor
            imageLabelView.tintColor = colorScheme.labelColor
            
            if isHighlighted != isServiceKey {
                
                if isSpecialReturnType {
                    backgroundView.backgroundColor = tintColor
                    mainLabelView.textColor = colorScheme.specialReturnLabelColor
                    imageLabelView.tintColor = colorScheme.specialReturnLabelColor
                }
                
                shiftUpLabelView.isHidden = true
                shiftDownLabelView.isHidden = true
                shiftLeftLabelView.isHidden = true
                shiftRightLabelView.isHidden = true
            }
            else {
                
                if !isSpecialReturnType {
                    backgroundView.backgroundColor = colorScheme.keyColor
                }
                
                mainLabelView.textColor = colorScheme.labelColor
                imageLabelView.tintColor = colorScheme.labelColor
                shiftUpLabelView.isHidden = false
                shiftDownLabelView.isHidden = false
                shiftLeftLabelView.isHidden = false
                shiftRightLabelView.isHidden = false
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                isHighlighted = false
            }
            else {
                backgroundView.backgroundColor = colorScheme.serviceKeyColor
                mainLabelView.textColor = colorScheme.disabledKeyLabelColor
                imageLabelView.tintColor = colorScheme.disabledKeyLabelColor
            }
        }
    }
    
    init(label: String = "", shiftDownLabel: String = "") {
        super.init(frame: CGRect())
        
        mainLabel = label
        shiftUpLabelView.text = KeyboardLayout.shiftUpDictionary[label]
        
        // It is for activation of touch events
        backgroundColor = .touchableClear
        
        backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.isExclusiveTouch = false
        addSubview(backgroundView)
        
        addSubview(mainLabelView)
        mainLabelView.text = mainLabel
        mainLabelView.numberOfLines = 2
        
        addSubview(shiftUpLabelView)
        addSubview(shiftDownLabelView)
        
        if specialKey == .space {
            shiftDownLabelView.text = SpecialKey.space.label
            
            addSubview(shiftLeftLabelView)
            
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
    private var spacing: CGFloat = 0
    
    public func configure() {
        configure(size: frame.size, spacing: spacing, labelFontSize: baseFontSize)
    }
    
    public func configure(size: CGSize, spacing: CGFloat, labelFontSize: CGFloat) {
        frame.size = size
        baseFontSize = labelFontSize
        self.spacing = spacing
        
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
        
        backgroundView.layer.cornerRadius = spacing
        
        let keyEdgeInset = spacing / 2
        
        backgroundView.frame = frame.insetBy(dx: keyEdgeInset, dy: keyEdgeInset)
        backgroundView.frame.origin = .init(x: keyEdgeInset, y: keyEdgeInset)
        
        let verticalShiftLabelIndent = spacing * 2.2
        let horizontalShiftLabelIndent = spacing * 1.0
        
        mainLabelView.frame.size.width = size.width - spacing * 2
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
    
    private func input() {
        if specialKey == .return {
            KeyboardViewController.shared.keyAction(label: SpecialKey.return.label)
        }
        else {
            KeyboardViewController.shared.keyAction(label: mainLabelView.text ?? "")
        }
        
        KeyboardViewController.shared.updateDocumentContext()
    }
    
    private var autorepeatStartTimer: Timer?
    private var repeatTimer: Timer?
    
    private func startAutorepeat() {
        input()
        
        autorepeatStartTimer = .scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
            self.repeatTimer = .scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
                DispatchQueue.main.async {
                    self.input()
                }
            }
        }
    }
    
    private func stopAutorepeat() {
        autorepeatStartTimer?.invalidate()
        repeatTimer?.invalidate()
    }
    
    var longPressGestureRecognizer: UILongPressGestureRecognizer!
    var gestureStartPoint: CGPoint!
    
    @objc func longPressGestureAction(gesture: UIGestureRecognizer) {
        isHighlighted = true
        
        KeyboardViewController.shared.keyboardView.unicodeCollectionView.isHiddenUnicodeNames = true
        
        switch gesture.state {
            
        case .began:
            
            isHighlighted = true
            
            gestureStartPoint = gesture.location(in: self)
            
            if specialKey == .delete {
                startAutorepeat()
            }
            
        case .ended:
            
            if specialKey == .delete {
                stopAutorepeat()
            }
            else {
                input()
            }
            
            mainLabelView.text = mainLabel
            updateLocalizedStrings()
            isHighlighted = false
            
        default:
            
            let gestureCurrentPoint = gesture.location(in: self)
            
            let offsetPoint = CGPoint(
                x: gestureCurrentPoint.x - gestureStartPoint.x,
                y: gestureCurrentPoint.y - gestureStartPoint.y
            )
            
            
            let distance = hypot(offsetPoint.x, offsetPoint.y)
            let threshold = bounds.size.height / 2
            
            if distance > threshold {
                let direction = ShiftDirection.init(rawValue: (atan2(-offsetPoint.y, offsetPoint.x) / .pi * 4).rounded() / 4) ?? .left
                
                switch direction {
                    
                case .up:
                    if shiftUpLabelView.text != nil && shiftUpLabelView.text != "" {
                        mainLabelView.text = shiftUpLabelView.text
                    }
                    else if specialKey == nil {
                        mainLabelView.text = mainLabel.uppercased()
                    }
                    
                case .down:
                    mainLabelView.text = shiftDownLabelView.text?.first?.description
                    
                case .downRight:
                    if shiftDownLabelView.text!.count > 1 {
                        mainLabelView.text = String(shiftDownLabelView.text!.last!)
                    }
                    else {
                        mainLabelView.text = ""
                    }
                    
                case .left:
                    mainLabelView.text = shiftLeftLabelView.text
                    
                case .right:
                    mainLabelView.text = shiftRightLabelView.text
                    
                case .downLeft, .upRight, .upLeft:
                    mainLabelView.text = ""
                }
            }
            else {
                mainLabelView.text = mainLabel
                updateLocalizedStrings()
            }
        }
        
        mainLabelView.center = backgroundView.center
    }
    
    var specialKey: SpecialKey? {
        return SpecialKey(rawValue: mainLabel)
    }
    
    private enum ShiftDirection: CGFloat {
        case downLeft = -0.75
        case down = -0.5
        case downRight = -0.25
        case right = 0
        case upRight = 0.25
        case up = 0.5
        case upLeft = 0.75
        case left = 1
    }
}

public enum SpecialKey: String {
    var label: String {
        return rawValue
    }
    
    case delete = "delete"
    case space = " "
    case `return` = "return"
    case tab = "tab"
    case nextKeyboard = "NextKeyboard"
    case dismissKeyboard = "HideKeyboard"
    case settings = "Settings"
    case horizontalMode = "▄▄"
    case verticalMode = "▝█▖"
}

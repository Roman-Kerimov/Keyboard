//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-10.
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
            mainLabelView.text = Key.return.label
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
    
    public var key: Key {
        didSet {
            setLabels()
        }
    }
    
    private func setLabels() {
        mainLabelView.text = key.label
        shiftDownLabelView.text = key.shiftDownLabel
        shiftUpLabelView.text = key.shiftUpLabel
        shiftRightLabelView.text = key.shiftRightLabel
        shiftLeftLabelView.text = key.shiftLeftLabel
    }
    
    private var labelFileName: String {
        return "Labels_\(key.label)"
    }
    
    private let mainLabelView: LabelView = .init()
    private let imageLabelView: UIImageView = .init()
    private let shiftUpLabelView: LabelView = .init()
    private let shiftDownLabelView: LabelView = .init()
    
    private let shiftLeftLabelView: LabelView = .init()
    private let shiftRightLabelView: LabelView = .init()
    
    private var backgroundView: UIView!
    
    private var returnKeyType: UIReturnKeyType? {
        if key == .return {
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
        return key.label.count > 1 && key != .space && key != .tab && returnKeyType != .default
    }
    
    private var isSpecialReturnType: Bool {
        return key == .return
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
    
    init(key: Key) {
        self.key = key
        super.init(frame: CGRect())
        
        // It is for activation of touch events
        backgroundColor = .touchableClear
        
        setLabels()
        
        backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.isExclusiveTouch = false
        addSubview(backgroundView)
        
        addSubview(mainLabelView)
        mainLabelView.numberOfLines = 2
        
        addSubview(shiftUpLabelView)
        addSubview(shiftDownLabelView)
        addSubview(shiftLeftLabelView)
        addSubview(shiftRightLabelView)
        
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didMoveToSuperview() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardStateDidChange), name: .KeyboardStateDidChange, object: nil)
    }
    
    @objc func keyboardStateDidChange() {
        guard let key = KeyboardSettings.shared.currentKeys.first else {
            return
        }
        
        if key == self.key {
            mainLabelView.text = KeyboardSettings.shared.character
        }
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
        
        if key.label.count == 1 {
            mainLabelView.font = UIFont.init(name: "Symbola", size: baseFontSize)
        }
        else {
            mainLabelView.font = UIFont.systemFont(ofSize: baseFontSize)
        }
        
        let shiftLabelFont = mainLabelView.font.withSize(labelFontSize/1.8)
        shiftUpLabelView.font = shiftLabelFont
        shiftDownLabelView.font = shiftLabelFont
        shiftLeftLabelView.font = shiftLabelFont
        shiftRightLabelView.font = shiftLabelFont
        
        switch key {
        case .delete, .return, .tab:
            mainLabelView.font = mainLabelView.font.withSize(shiftLabelFont.pointSize)
            
        case .settings:
            mainLabelView.font = mainLabelView.font.withSize(shiftLabelFont.pointSize * 2.5)
            
        default:
            break
        }
        
        if imageLabelView.image != nil {
            imageLabelView.image = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: labelFontSize/24, for: self)?.withRenderingMode(.alwaysTemplate)
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

        if key == .space {
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
    
    private var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    private var gestureStartPoint: CGPoint!
    private var startPointSpeed: CGFloat = 0
    private var previousTime: TimeInterval = 0
    private var previousDistance: CGFloat = 0
    
    private var shiftDirections: [CGFloat] = .init()
    
    @objc func longPressGestureAction(gesture: UIGestureRecognizer) {
        isHighlighted = true
        
        KeyboardViewController.shared.keyboardView.unicodeCollectionView.isHiddenUnicodeNames = true
        
        switch gesture.state {
            
        case .began:
            
            shiftDirections = .init()
            
            isHighlighted = true
            
            gestureStartPoint = gesture.location(in: self)
            startPointSpeed = 0
            
            previousTime = Date.timeIntervalSinceReferenceDate
            previousDistance = 0
            
            KeyboardSettings.shared.down(key: key)
            
        case .ended:
            
            KeyboardSettings.shared.up(key: key)
            
            mainLabelView.text = key.label
            updateLocalizedStrings()
            isHighlighted = false
            Array<CharacterComponent>.extraArrayExtension = .init()
            
        default:
            
            let gestureCurrentPoint = gesture.location(in: self)
            
            let offsetPoint = CGPoint(
                x: gestureCurrentPoint.x - gestureStartPoint.x,
                y: gestureCurrentPoint.y - gestureStartPoint.y
            )
            
            
            let distance = hypot(offsetPoint.x, offsetPoint.y)
            let threshold = bounds.size.height / 2
            let direction = (atan2(-offsetPoint.y, offsetPoint.x) / .pi * 4).rounded() / 4
            
            let currentTime = Date.timeIntervalSinceReferenceDate
            let speed = (distance - previousDistance) / .init(currentTime - previousTime)
            previousTime = currentTime
            previousDistance = distance
            
            if shiftDirections.last == direction  || startPointSpeed > 300 {
                gestureStartPoint = gesture.location(in: self)
                previousDistance = 0
                startPointSpeed = speed
            }
            else if distance > threshold {
                shiftDirections.append(direction)
                
                let shiftDirection: KeyboardSettings.ShiftDirection
                
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
                
                KeyboardSettings.shared.shift(direction: shiftDirection)
            }
        }
        
        mainLabelView.center = backgroundView.center
    }
}

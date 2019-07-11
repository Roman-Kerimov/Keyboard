//
//  KeyView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-07-10.
//
//

import UIKit

class KeyView: UIButton {
    
    static var size: CGSize = .zero
    static var spacing: CGFloat = 0
    static var labelFontSize: CGFloat = 1
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        guard let returnKeyType = returnKeyType else {
            return
        }
        
        switch returnKeyType {
            
        case .default:
            mainLabelView.text = Key.enter.label
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
    
    override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        super.addTarget(target, action: action, for: controlEvents)
        
        removeGestureRecognizer(longPressGestureRecognizer)
    }
    
    public var key: Key {
        didSet {
            setNeedsLayout()
        }
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
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                isHighlighted = false
            }
        }
    }
    
    init(key: Key) {
        self.key = key
        super.init(frame: CGRect())
        
        // It is for activation of touch events
        backgroundColor = .touchableClear
        
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
        
        if let imageLabel: UIImage = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: 1) {
            imageLabelView.image = imageLabel
            mainLabelView.isHidden = true
        }
        
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        addGestureRecognizer(longPressGestureRecognizer)
        
        longPressGestureRecognizer.minimumPressDuration = 0
    
        NotificationCenter.default.addLocaleObserver(self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsLayout), name: .KeyboardStateDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsLayout), name: .KeyboardAppearanceDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsLayout), name: .DocumentContextDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        mainLabelView.text = Keyboard.default.currentKey == key ? Keyboard.default.currentLabel : key.label
        shiftDownLabelView.text = key.shiftDownLabel
        shiftUpLabelView.text = key.shiftUpLabel
        shiftRightLabelView.text = key.shiftRightLabel
        shiftLeftLabelView.text = key.shiftLeftLabel
        
        shiftUpLabelView.textColor = .secondaryLabelColor
        shiftDownLabelView.textColor = .secondaryLabelColor
        shiftLeftLabelView.textColor = .secondaryLabelColor
        shiftRightLabelView.textColor = .secondaryLabelColor
        
        updateLocalizedStrings()
        
        backgroundView.backgroundColor = !isEnabled ? .quaternaryLabelColor : isHighlighted != isServiceKey && isSpecialReturnType ? .controlAccentColor : isHighlighted == isServiceKey && !isSpecialReturnType ? .controlColor : .quaternaryLabelColor
        
        mainLabelView.textColor = !isEnabled ? .disabledControlTextColor : isHighlighted != isServiceKey && isSpecialReturnType ? .alternateSelectedControlTextColor : .labelColor
        
        imageLabelView.tintColor = mainLabelView.textColor
        
        let isHiddenShiftLabelView: Bool = isHighlighted != isServiceKey
        shiftUpLabelView.isHidden = isHiddenShiftLabelView
        shiftDownLabelView.isHidden = isHiddenShiftLabelView
        shiftLeftLabelView.isHidden = isHiddenShiftLabelView
        shiftRightLabelView.isHidden = isHiddenShiftLabelView
        
        
        let characterLabelFont: UIFont = .characterFont(ofSize: KeyView.labelFontSize)
        let nameLabelFont: UIFont = .systemFont(ofSize: KeyView.labelFontSize/1.8)
        
        mainLabelView.font = [.space, .enter, .delete].contains(key) ? nameLabelFont : characterLabelFont
        
        let characterShiftLabelFont = characterLabelFont.withSize(nameLabelFont.pointSize)
        
        shiftUpLabelView.font = characterShiftLabelFont
        shiftDownLabelView.font = characterShiftLabelFont
        shiftLeftLabelView.font = nameLabelFont
        shiftRightLabelView.font = nameLabelFont
        
        if imageLabelView.image != nil {
            imageLabelView.image = UIImage.init(fromPDF: labelFileName, withExtension: .ai, withScale: KeyView.labelFontSize/24)?.withRenderingMode(.alwaysTemplate)
        }
        
        backgroundView.layer.cornerRadius = KeyView.spacing
        backgroundView.frame = CGRect.init(origin: .zero, size: frame.size).insetBy(scalar: KeyView.spacing/2)
        
        let verticalShiftLabelIndent = KeyView.spacing * 2.2
        let horizontalShiftLabelIndent = KeyView.spacing * 1.0
        
        mainLabelView.frame.size.width = frame.width - KeyView.spacing * 2
        mainLabelView.center = backgroundView.center
        
        shiftUpLabelView.center.y = verticalShiftLabelIndent
        shiftDownLabelView.center.y = frame.height - verticalShiftLabelIndent

        if [.space, .spaceWithoutReturn].contains(key) {
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
    
    private var shiftDirections: [Keyboard.ShiftDirection] = .init()
    
    @objc func longPressGestureAction(gesture: UIGestureRecognizer) {
        isHighlighted = true
        
        switch gesture.state {
            
        case .began:
            
            shiftDirections = .init()
            
            isHighlighted = true
            
            gestureStartPoint = gesture.location(in: self)
            startPointSpeed = 0
            
            previousTime = Date.timeIntervalSinceReferenceDate
            previousDistance = 0
            
            Keyboard.default.down(key: key)
            
        case .ended:
            
            Keyboard.default.up(key: key)

            isHighlighted = false
            
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
            
            if shiftDirections.last == shiftDirection  || startPointSpeed > 300 {
                gestureStartPoint = gesture.location(in: self)
                previousDistance = 0
                startPointSpeed = speed
            }
            else if distance > threshold {
                shiftDirections.append(shiftDirection)
                Keyboard.default.shift(direction: shiftDirection)
            }
        }
    }
}

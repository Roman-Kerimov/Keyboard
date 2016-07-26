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
    
    private var keyColor: UIColor! {
        didSet {
            backgroundView.backgroundColor = keyColor
        }
    }
    private var labelColor: UIColor! {
        didSet {
            label.textColor = labelColor
        }
    }
    private var borderColor: UIColor! {
        didSet {
            backgroundView.layer.borderColor = borderColor.cgColor
        }
    }
    
    var isDarkColorScheme: Bool! {
        didSet {
            
            if self.isDarkColorScheme! {
                keyColor = UIColor.black()
                labelColor = UIColor.white()
                borderColor = UIColor.white()
            }
            else {
                keyColor = UIColor.white()
                labelColor = UIColor.black()
                borderColor = UIColor.black()
            }
        }
    }
    
    static var allKeys: [KeyView] = []
    
    static var keySize: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            for key in allKeys {
                key.widthConstraint.constant = keySize.width
                key.heightConstraint.constant = keySize.height
                
                key.label.font = UIFont.systemFont(ofSize: keySize.height * 3/5)
                
                key.centerYLabelConstraint.constant = -key.label.font.pointSize / 20
            }
        }
    }
    
    var centerYLabelConstraint: NSLayoutConstraint!
    
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    
    var label: UILabel!
    
    var backgroundView: UIView!
    
    init(labelString: String) {
        super.init(frame: CGRect())
        
        isDarkColorScheme = false
        
        KeyView.allKeys.append(self)
        
        widthConstraint = widthAnchor.constraint(equalToConstant: 0)
        widthConstraint.isActive = true
        
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
        
        backgroundView = UIView()
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundIndent = -keySpace/2
        backgroundView.layer.cornerRadius = -backgroundIndent
        backgroundView.layer.borderWidth = 1/2
        
        
        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        backgroundView.widthAnchor.constraint(equalTo: widthAnchor, constant: backgroundIndent).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: heightAnchor, constant: backgroundIndent).isActive = true
        
        label = UILabel()
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelString
        label.textAlignment = .center
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        centerYLabelConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        centerYLabelConstraint.isActive = true
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureAction(gesture:)))
        addGestureRecognizer(longPressGestureRecognizer)
        
        longPressGestureRecognizer.minimumPressDuration = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    var action: ((KeyView) -> Void)?
    
    var state = KeyState.none {
        didSet {
            if let keyAction = action {
                keyAction(self)
            }
        }
    }

    var gestureStartPoint: CGPoint!
    
    func longPressGestureAction(gesture: UIGestureRecognizer) {
        
        switch gesture.state {
            
        case .began:
            
            backgroundView.backgroundColor = tintColor
            label.textColor = UIColor.white()
            
            state = .lowerCase
            
            gestureStartPoint = gesture.location(in: self)
            
            
        case .ended:
            
            backgroundView.backgroundColor = keyColor
            label.textColor = labelColor
            state = .ended
            
        default:
            
            var newState = KeyState.none
            
            let deltaY = gestureStartPoint.y - gesture.location(in: self).y
            
            if deltaY > bounds.size.height/2 {
                newState = .upperCase
            }
            else if deltaY < -bounds.size.height/2 {
                newState = .deleteBackward
            }
            else {
                newState = .lowerCase
            }
            
            if state != newState {
                state = newState
            }
            
        }
    }
    
}

enum KeyState {
    case lowerCase, upperCase
    case space, newLine, tab
    case deleteBackward, deleteForward
    case ended, none
}

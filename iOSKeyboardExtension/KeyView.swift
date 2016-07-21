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
    
    init(labelString: String) {
        super.init(frame: CGRect())
        
        KeyView.allKeys.append(self)
        
        widthConstraint = widthAnchor.constraint(equalToConstant: 0)
        widthConstraint.isActive = true
        
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
        
        let backgroundView = UIView()
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor.white()
        
        
        let backgroundIndent = -keySpace/2
        backgroundView.layer.cornerRadius = -backgroundIndent
        backgroundView.layer.borderColor = UIColor.black().cgColor
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

}

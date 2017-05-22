//
//  HalfKeyboardView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 10.07.16.
//
//

import UIKit

class HalfKeyboardView: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var rows: [UIStackView] = []
    
    init(rowCount: Int) {
        super.init(frame: CGRect())
        
        axis = .vertical
        distribution = .fillEqually
        
        for _ in 0..<rowCount {
            let row = UIStackView()
            
            row.axis = .horizontal
            row.distribution = .fillEqually
            
            rows.append(row)
            addArrangedSubview(row)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

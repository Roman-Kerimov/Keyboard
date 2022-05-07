//
//  SoftwareKeyboardSupportViewModifier.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2020-02-10.
//

import SwiftUI
import Combine

struct SoftwareKeyboardSupportViewModifier: ViewModifier {
    
    @State var height: CGFloat = 0
    @State var animationDuration: Double = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, height)
            .edgesIgnoringSafeArea(height.isZero ? Edge.Set() : .bottom)
            .animation(.easeOut(duration: animationDuration))
            .onAppear {
                _ = Publishers.Merge(self.keyboardWillChangeFramePublisher, self.keyboardWillHidePublisher)
                    .subscribe(on: RunLoop.main)
                    .sink {
                        self.height = $0.height
                        self.animationDuration = $0.animationDuration
                    }
            }
    }
    
    private var keyboardWillChangeFramePublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification).map {
        return (
            height: ($0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect).height,
            animationDuration: Double(0)
        )
    }
    
    private var keyboardWillHidePublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map {
        return (
            height: CGFloat(0),
            animationDuration: $0.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        )
    }
    
}

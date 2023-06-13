//
//  AnimationCompletionObserverAnimatableModifier.swift
//  
//
//  Created by Roman Kerimov on 2022-08-03.
//

import SwiftUI

extension View {
    func onAnimationCompleted<Value: VectorArithmetic>(
        for value: Value,
        completion: @escaping () -> Void
    ) -> ModifiedContent<Self, AnimationCompletionObserverModifier<Value>> {
        modifier(AnimationCompletionObserverModifier(observedValue: value, completion: completion))
    }
}

struct AnimationCompletionObserverModifier<Value>: AnimatableModifier where Value: VectorArithmetic {
    
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }
    
    private var targetValue: Value
    
    private var completion: () -> Void
    
    init(observedValue: Value, completion: @escaping () -> Void) {
        self.completion = completion
        animatableData = observedValue
        targetValue = observedValue
    }
    
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else {
            return
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

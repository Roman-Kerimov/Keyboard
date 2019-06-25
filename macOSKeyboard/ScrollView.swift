//
//  ScrollView.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2019-06-25.
//

import SwiftUI

extension ScrollView {
    func withoutScrollIndicator() -> _ModifiedContent<ScrollView<Content>, _PaddingLayout> {
        self.padding(.trailing, -100)
    }
}

//
//  CharacterSequenceCell.swift
//  
//
//  Created by Roman Kerimov on 2022-08-03.
//

import SwiftUI

struct CharacterSequenceCell: View {
    @ObservedObject var item: CharacterSequence.Item
    let fontSize: CGFloat
    
    var body: some View {
        Text(item.character)
            .font(.custom(.characterFontName, size: fontSize))
            .frame(
                width: floor(
                    item.character.size(fontName: .characterFontName, fontSize: fontSize).width
                    + .characterSequenceItemWidthExtensionFontSizeFactor * fontSize
                )
            )
            .frame(maxHeight: .infinity)
            .background(Color.primary.opacity(.characterSequenceBackgroundOpacity))
            .cornerRadius(.characterSequenceCornerRadiusFontSizeFactor * fontSize)
    }
}

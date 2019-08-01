//
//  CharacterSequenceView.swift
//  Keyboard macOS
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI

struct CharacterSequenceView : View {
    @EnvironmentObject var characterSequence: CharacterSequence
    
    let fontSize: CGFloat = 22
    var body: some View {
        
        let spacing = floor(.characterSequenceSpacingFontSizeFactor * self.fontSize)
        
        typealias Item = (character: String, width: CGFloat)
        
        let characterItems: [Item] = characterSequence.characters.map {($0.description, floor($0.description.size(fontName: .characterFontName, fontSize: self.fontSize).width + .characterSequenceItemWidthExtensionFontSizeFactor * self.fontSize))}
        
        let autocompleteWidth = characterSequence.autocompleteLabel.isEmpty ? 0 : characterSequence.autocompleteLabel.size(fontName: .characterFontName, fontSize: self.fontSize).width
        
        DispatchQueue.main.async {
            AppDelegate.characterSequenceWindow.updateFrame(width: characterItems.map {$0.width + spacing} .reduce(0, +) + autocompleteWidth)
        }
        
        return GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .center, spacing: spacing) {
                    ForEach(characterItems, id: \.character ) { item in
                        Text(item.character)
                            .frame(width: item.width, height: geometry.size.height)
                            .font(.custom(.characterFontName, size: self.fontSize))
                            .background(Color.primary.opacity(Double(.characterSequenceBackgroundOpacity)))
                            .cornerRadius(.characterSequenceCornerRadiusFontSizeFactor * self.fontSize)
                    }
                    
                    Text(self.characterSequence.autocompleteLabel)
                        .frame(width: autocompleteWidth, height: geometry.size.height)
                        .font(.custom(.characterFontName, size: self.fontSize))
                        .foregroundColor(.accentColor)
                        .allowsTightening(true)
                        .onTapGesture(perform: self.characterSequence.autocomplete)
                }
            }
        }
    }
}

#if DEBUG
struct CharacterSequenceView_Previews : PreviewProvider {
    static var previews: some View {
        Keyboard.default.delegate?.prepareForPreview()
        
        let characterSequence: CharacterSequence = .init()
        characterSequence.characters = "2+3".map {$0}
        characterSequence.autocompleteLabel = "=5"
        
        return CharacterSequenceView()
            .environmentObject(characterSequence)
            .previewLayout(.fixed(width: 83, height: .characterSequenceDefaultHeight))
    }
}
#endif

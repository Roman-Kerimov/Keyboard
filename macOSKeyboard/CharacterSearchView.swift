//
//  CharacterSearchView.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2019-06-24.
//

import SwiftUI

struct CharacterSearchView : View {
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View { 
        GeometryReader {geometry in
            ScrollView {
                VStack {
                    ForEach(0..<self.keyboard.foundCharacters.count) {item in
                        
                        Text(self.keyboard.foundCharacters[item].description)
                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                            .font(.system(size: geometry.size.width * .characterSearchViewFontSizeFactor))
                            .tapAction({self.keyboard.insert(item: item)})
                    }
                }
            }
            .withoutScrollIndicator()
        }
    }
}

#if DEBUG
struct CharacterSearchView_Previews : PreviewProvider {
    static var previews: some View {
        CharacterSearchView()
    }
}
#endif

//
//  CharacterSearchView.swift
//  macOSKeyboard
//
//  Created by Roman Kerimov on 2019-06-24.
//

import SwiftUI

struct CharacterSearchView : View {
    @EnvironmentObject var characterSearch: CharacterSearch
    
    var body: some View { 
        GeometryReader {geometry in
            ScrollView {
                VStack {
                    ForEach(0..<self.characterSearch.foundCharacters.count) {item in
                        
                        Text(self.characterSearch.foundCharacters[item].description)
                            .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                            .font(.system(size: geometry.size.width * .characterSearchViewFontSizeFactor))
                            .tapAction({self.characterSearch.insert(item: item)})
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

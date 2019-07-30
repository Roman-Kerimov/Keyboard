//
//  CharacterSearchView.swift
//  Keyboard macOS
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
                        HStack {
                            Text(self.characterSearch.foundCharacters[item].description)
                                .frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
                                .font(.system(size: geometry.size.width * .characterSearchViewFontSizeFactor))
                                .tapAction {self.characterSearch.insert(item: item)}
                            Spacer.init(minLength: 100)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct CharacterSearchView_Previews : PreviewProvider {
    static var previews: some View {
        Keyboard.default.delegate?.prepareForPreview()
        LoadUnicodeDataFiles.init().start()
        
        return Group {
            ForEach(["face", "keyboard", "thum", "ru"], id: \.self) { searchQuery in
                CharacterSearchView()
                    .environmentObject(CharacterSearch.init(query: searchQuery))
                    .previewDisplayName(searchQuery)
                    .previewLayout(.fixed(width: .characterSearchDefaultWidth, height: .characterSearchDefaultHeight))
            }
        }
    }
}
#endif

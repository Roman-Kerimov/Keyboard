//
//  CharacterSearchView.swift
//  
//
//  Created by Roman Kerimov on 2019-06-24.
//

import SwiftUI

public struct CharacterSearchView: View {
    @StateObject var characterSearch = Keyboard.default.characterSearch
    
    public init() {}
    
    @State private var offset: CGFloat = 0
    
    private func characterFontSize(geometry: GeometryProxy) -> CGFloat {
        geometry.size.width * .characterSearchViewFontSizeFactor
    }
    
    private func unicodeNameFontSize(geometry: GeometryProxy) -> CGFloat {
        characterFontSize(geometry: geometry) / 2
    }
    
    public var body: some View {
        GeometryReader {geometry in
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(
                        characterSearch.foundUnicodeItems.enumerated().map {($0, $1)},
                        id: \.0
                    ) { (offset, unicodeItem) in
                        Text(unicodeItem.codePoints.previewDescription)
                            .minimumScaleFactor(0.3)
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.width)
                            .font(.system(size: characterFontSize(geometry: geometry)))
                            .onTapGesture {
                                characterSearch.insert(item: offset)
                            }
                            .help(unicodeItem.localizedName)
                            .contextMenu {
                                Text(unicodeItem.localizedName)
                            }
                    }
                    
                    if self.characterSearch.isSearching {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    }
                }
            }
        }
    }
}

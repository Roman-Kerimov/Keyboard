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
    
    @State private var isUnicodeNamesPresented = false
    
    private func characterFontSize(geometry: GeometryProxy) -> CGFloat {
        geometry.size.width * .characterSearchViewFontSizeFactor
    }
    
    private func unicodeNameFontSize(geometry: GeometryProxy) -> CGFloat {
        characterFontSize(geometry: geometry) / 2
    }
    
    private let scrollCoordinateSpaceName = "scrollCoordinateSpace"
    
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
                    }
                    
                    if self.characterSearch.isSearching {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    }
                }
                .background {
                    GeometryReader {
                        Color.clear.preference(
                            key: ViewOffsetPreferenceKey.self,
                            value: -$0.frame(in: .named(scrollCoordinateSpaceName)).origin.y
                        )
                    }
                }
                .onPreferenceChange(ViewOffsetPreferenceKey.self) { value in
                    offset = value
                }
            }
            .coordinateSpace(name: scrollCoordinateSpaceName)
            .overlay(alignment: .leading) {
                #if canImport(UIKit)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(
                            characterSearch.foundUnicodeItems.enumerated().map {($0, $1)},
                            id: \.0
                        ) { (offset, unicodeItem) in
                            Text(unicodeItem.localizedName)
                                .font(.system(size: unicodeNameFontSize(geometry: geometry)).bold())
                                .minimumScaleFactor(0.5)
                                .scaledToFit()
                                .padding(.horizontal, unicodeNameFontSize(geometry: geometry) / 4)
                                .background(Color.unemphasizedSelectedTextBackground)
                                .frame(height: geometry.size.width)
                        }
                    }
                    .offset(y: -offset)
                }
                .opacity(isUnicodeNamesPresented ? 1 : 0)
                .allowsHitTesting(false)
                .frame(width: UIScreen.main.bounds.width - geometry.size.width)
                .offset(x: geometry.size.width)
                #endif
            }
            .onReceive(NotificationCenter.default.publisher(for: .KeyboardStateDidChange)) { notification in
                isUnicodeNamesPresented = false
            }
            .simultaneousGesture(
                DragGesture()
                    .onChanged { dragGesture in
                        isUnicodeNamesPresented = true
                    }
            )
        }
    }
}

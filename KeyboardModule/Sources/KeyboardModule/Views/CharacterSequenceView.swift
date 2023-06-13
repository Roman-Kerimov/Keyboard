//
//  CharacterSequenceView.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import SwiftUI

public struct CharacterSequenceView: View {
    @ObservedObject private var characterSequence: CharacterSequence
    
    private let fontSize: CGFloat
    
    private let contentViewCoordinateSpaceName = "contentViewCoordinateSpace"
    
    public init(characterSequence: CharacterSequence, fontSize: CGFloat = 22) {
        _characterSequence = ObservedObject(wrappedValue: characterSequence)
        self.fontSize = fontSize
    }
    
    @State private var cells: [Cell] = []
    
    @State private var startGestureIndex: Int?
    @State private var sourceIndex: Int?
    @State private var targetIndex: Int?
    
    @State private var offset: CGFloat = 0
    @State private var minXCellOffset: CGFloat = 0
    @State private var midXCellOffset: CGFloat = 0
    
    @State private var gestureType: GestureType?
    
    private enum GestureType {
        case reordering
        case casing
    }
    
    private func resetGestureState() {
        startGestureIndex = nil
        sourceIndex = nil
        targetIndex = nil
        offset = 0
        minXCellOffset = 0
        midXCellOffset = 0
        gestureType = nil
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: floor(.characterSequenceSpacingFontSizeFactor * fontSize)) {
                ForEach(characterSequence.items) { item in
                    CharacterSequenceCell(item: item, fontSize: fontSize)
                        .id(item)
                        .opacity(sourceIndex == item.offset && gestureType == .reordering ? 0 : 1)
                        .background(
                            GeometryReader { geometry in
                                Color.clear
                                    .preference(
                                        key: CellPreferenceKey.self,
                                        value: [
                                            Cell(
                                                index: item.offset,
                                                frame: geometry.frame(in: .named(contentViewCoordinateSpaceName))
                                            )
                                        ]
                                    )
                            }
                        )
                }
                
                Text(characterSequence.autocompleteLabel)
                    .font(.custom(.characterFontName, size: fontSize))
                    .foregroundColor(.accentColor)
                    .allowsTightening(true)
                    .frame(
                        width: characterSequence.autocompleteLabel.isEmpty
                        ? 0
                        : characterSequence.autocompleteLabel
                            .size(fontName: .characterFontName, fontSize: self.fontSize).width
                    )
                    .frame(maxHeight: .infinity)
                    .onTapGesture(perform: characterSequence.autocomplete)
            }
            .background {
                GeometryReader { contentGeometry in
                    Color.clear
                        .onChange(of: characterSequence.items) { items in
                            DispatchQueue.main.async {
                                characterSequence.contentWidth = contentGeometry.size.width
                            }
                        }
                }
            }
            .onPreferenceChange(CellPreferenceKey.self) { value in
                cells = value
            }
            .gesture(
                DragGesture(minimumDistance: 3)
                    .onChanged { dragGesture in
                        let cell = cells
                            .first {
                                ($0.frame.minX...$0.frame.maxX).contains(dragGesture.location.x + midXCellOffset)
                            }
                        
                        if let cell = cell, cell.index != targetIndex {
                            if sourceIndex == nil {
                                
                                sourceIndex = cell.index
                                startGestureIndex = sourceIndex
                                
                                minXCellOffset = cell.frame.minX - dragGesture.startLocation.x
                                midXCellOffset = cell.frame.midX - dragGesture.startLocation.x
                            } else {
                                targetIndex = cell.index
                            }
                            
                            switch gestureType {
                            case .none:
                                gestureType = abs(dragGesture.translation.width / dragGesture.translation.height) > 0.5
                                ? .reordering
                                : .casing
                                
                            case .reordering:
                                if let sourceIndex = sourceIndex, let targetIndex = targetIndex, sourceIndex != targetIndex {
                                    withAnimation {
                                        if targetIndex == 0, characterSequence.items.first?.character == .space {
                                            
                                        } else {
                                            characterSequence.items
                                                .move(
                                                    fromOffsets: [sourceIndex],
                                                    toOffset: sourceIndex < targetIndex ? targetIndex + 1 : targetIndex
                                                )
                                        }
                                        
                                        self.sourceIndex = targetIndex
                                        self.targetIndex = nil
                                    }
                                }
                                
                            case .casing:
                                break
                            }
                        }
                        
                        switch gestureType {
                        case .none:
                            break
                            
                        case .reordering:
                            offset = dragGesture.location.x + minXCellOffset
                            
                        case .casing:
                            guard let sourceIndex = sourceIndex else {
                                break
                            }
                            
                            if dragGesture.translation.height < 0 {
                                characterSequence.items[sourceIndex].uppercase()
                            } else {
                                characterSequence.items[sourceIndex].lowercase()
                            }
                        }
                        
                        Key.delete.isHighlighted = dragGesture.location.x > max(characterSequence.contentWidth, geometry.size.width)
                    }
                    .onEnded { dragGesture in
                        if let sourceIndex = sourceIndex {
                            if Key.delete.isHighlighted {
                                characterSequence.items.remove(at: sourceIndex)
                                Key.delete.isHighlighted = false
                                resetGestureState()
                                
                            } else if startGestureIndex == 0, characterSequence.items[sourceIndex].character == .space {
                                
                                characterSequence.items.insert(CharacterSequence.Item(character: .space), at: 0)
                                
                                if sourceIndex == characterSequence.items.count - 2 {
                                    characterSequence.items.removeLast()
                                    resetGestureState()
                                }
                            }
                        }
                        
                        characterSequence.performCharacterSequenceUpdates()
                        
                        withAnimation(.easeInOut) {
                            offset = cells.first(where: {$0.index == sourceIndex})?.frame.minX ?? 0
                        }
                        
                        if gestureType == .casing {
                            resetGestureState()
                        }
                    }
            )
            .coordinateSpace(name: contentViewCoordinateSpaceName)
            .overlay(alignment: .leading) {
                if let sourceIndex = sourceIndex, sourceIndex < characterSequence.items.count, gestureType == .reordering {
                    CharacterSequenceCell(item: characterSequence.items[sourceIndex], fontSize: fontSize)
                        .offset(x: offset)
                        .onAnimationCompleted(for: offset) {
                            resetGestureState()
                        }
                }
            }
            .frame(
                width: geometry.size.width,
                alignment: characterSequence.contentWidth < geometry.size.width ? .leading : .trailing
            )
        }
    }
}

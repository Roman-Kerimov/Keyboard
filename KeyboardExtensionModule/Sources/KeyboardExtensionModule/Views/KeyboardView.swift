//
//  KeyboardView.swift
//  
//
//  Created by Roman Kerimov on 2020-12-18.
//

import SwiftUI
import KeyboardModule

@available(iOS 14.0, *)
struct KeyboardView: View {
    @EnvironmentObject var controller: KeyboardUIViewController
    @EnvironmentObject var keyboard: Keyboard
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var isSettingViewPresented = false
    
    var body: some View {
        GeometryReader { geometry -> AnyView in
            controller.updateSizes(
                keyboardViewMaxWidth: Bundle.main.isExtension ? geometry.size.width : UIScreen.main.bounds.width
            )
            
            switch colorScheme {
            case .light:
                UIKeyboardAppearance.current = .light
                
            case .dark:
                UIKeyboardAppearance.current = .dark
                
            @unknown default:
                UIKeyboardAppearance.current = .default
            }
            
            return AnyView(keyboardView)
        }
        .ignoresSafeArea()
    }
    
    var keyboardView: some View {
        ZStack(alignment: .trailing) {
            VStack(spacing: 0) {
                deleteRowView
                
                HStack(spacing: 0) {
                    CharacterSearchView()
                        .frame(width: controller.horizontalIndent)
                        .zIndex(1)
                    
                    if controller.isHorizontalMode {
                        layoutView(keyRows: Key.layoutBoard)
                    }
                    else {
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                layoutView(keyRows: Key.leftLayoutBoard)
                                Spacer()
                            }
                            
                            HStack(spacing: 0) {
                                Spacer()
                                layoutView(keyRows: Key.rightLayoutBoard)
                            }
                        }
                    }
                    
                    Spacer(minLength: controller.horizontalIndent)
                }
                .clipped()
                
                spaceRowView
            }
            .frame(width: controller.keyboardSize.width, height: controller.keyboardSize.height)
            
            Rectangle()
                .foregroundColor(isSettingViewPresented ? Color.black.opacity(0.1) : .clear)
                .onTapGesture {
                    controller.isSettingViewPresented = false
                }
            
            SettingsNavigationView()
                .frame(width: controller.settingsWidth)
                .offset(x: isSettingViewPresented ? 0 : controller.settingsWidth)
        }
        .onChange(of: controller.isSettingViewPresented) { value in
            withAnimation(.easeInOut(duration: controller.settingsAnimationDuration)) {
                isSettingViewPresented = value
            }
        }
    }
    
    var deleteRowView: some View {
        HStack(spacing: 0) {
            CharacterSequenceView()
                .frame(width: controller.characterSequenceWidth)
            
            KeyView(key: .delete)
                .frame(width: controller.deleteKeyWidth)
        }
        .frame(height: controller.deleteRowHeight)
    }
    
    func layoutView(keyRows: [[Key]]) -> some View {
        VStack(spacing: 0) {
            ForEach(keyRows) { keyRow in
                HStack(spacing: 0) {
                    ForEach(keyRow) { key in
                        KeyView(key: key)
                            .frame(width: controller.keySize.width, height: controller.keySize.height)
                    }
                }
            }
        }
    }
    
    var spaceRowView: some View {
        HStack(spacing: 0) {
            ForEach(controller.spaceRowKeyDescriptions) { keyDescription in
                KeyView(key: keyDescription.key)
                    .frame(width: keyDescription.width)
                    .clipped()
            }
        }
        .frame(height: controller.spaceRowHeight)
    }
}

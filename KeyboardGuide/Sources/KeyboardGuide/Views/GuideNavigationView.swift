//
//  GuideNavigationView.swift
//  Keyboard_iOS
//
//  Created by Roman Kerimov on 2019-08-02.
//

import SwiftUI
import KeyboardModule
import KeyboardExtensionModule
import UnicodeData

public struct GuideNavigationView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State var isSetUpView = false
    
    func updateIsSetUpView() {
        let appleKeyboards = UserDefaults.standard.object(forKey: "AppleKeyboards") as! [String]
        isSetUpView = !appleKeyboards.contains(where: {$0.hasPrefix(Bundle.main.bundleIdentifier!)})
        if !isSetUpView {
            isSetUpViewPresented = false
        }
    }
    
    @State var isSetUpViewPresented = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                Section(header: Text(LANGUAGES.uppercasedString)) {
                    ForEach(UnicodeData.default.preferredCharacterCollections(maxCount: 3)) { (characterCollection) in
                        LanguageCharactersRow(characterCollection: characterCollection)
                    }
                    
                    NavigationLink(destination: LanguageCharactersList()) {
                        Text(OTHER_LANGUAGES.string)
                            .foregroundColor(.accentColor)
                    }
                }
                
                Section(header: Text(SETTINGS.uppercasedString)) {
                    InterfaceLanguagePicker()
                }
                
                AboutSection()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Bundle.main.productName)
            .onAppear {
                updateIsSetUpView()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                updateIsSetUpView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { () -> AnyView in
                    if isSetUpView {
                        return AnyView(
                            Button(SET_UP.string) {
                                isSetUpViewPresented = true
                            }
                        )
                    } else {
                        return AnyView(
                            Link(destination: URL(string: UIApplication.openSettingsURLString)!) {
                                Image(systemName: "gear")
                            }
                        )
                    }
                }
            }
            .sheet(isPresented: $isSetUpViewPresented) {
                SetUpView()
            }
        }
        .padding(.horizontal, (horizontalSizeClass, verticalSizeClass) == (.regular, .regular) ? 1 : 0)
    }
}

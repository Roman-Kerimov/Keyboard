//
//  SetUpView.swift
//  
//
//  Created by Roman Kerimov on 2020-09-24.
//

import SwiftUI
import KeyboardModule

struct SetUpView: View {
    @EnvironmentObject var settings: Settings
    
    let iconWidth: CGFloat = 30
    let iconScaleEffect: CGFloat = 0.5
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(SET_UP_PRODUCT_NAME.string)
                .font(.title)
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .frame(width: iconWidth, height: iconWidth)
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "keyboard")
                            .foregroundColor(.white)
                    }
                    .scaleEffect(0.8)
                    .allowsHitTesting(false)
                    
                    Text.markdown(TAP_KEYBOARDS.string)
                }
                
                HStack {
                    Toggle(isOn: .constant(true)) {
                        EmptyView()
                    }
                    .frame(width: iconWidth)
                    .scaleEffect(iconScaleEffect)
                    .allowsHitTesting(false)
                    
                    Text.markdown(TURN_ON_PRODUCT_NAME.string)
                }
            }
            
            Spacer()
            
            Link(GET_STARTED.string, destination: URL(string: UIApplication.openSettingsURLString)!)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(10)
            
            Spacer()
        }
    }
}

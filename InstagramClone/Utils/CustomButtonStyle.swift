//
//  CustomButtonStyle.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var background: Color
    var foreground: Color
    var height: CGFloat?
    var isDisbaled: Bool?
    
    func makeBody(configuration: Configuration) -> some View {
        
        let buttonHeight = height ?? 50
        let isButtonDisbaled = isDisbaled ?? false
        
        configuration.label
            .font(.title3.bold())
            .foregroundStyle(foreground)
            .frame(height: buttonHeight)
            .frame(maxWidth: .infinity)
            .background(isButtonDisbaled ? background.opacity(0.8) : background)
            .clipShape(.rect(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.linear(duration: 0.2), value: configuration.isPressed)
    }
}

struct CustomButtonIconStyle: ButtonStyle {
    var frame: CGSize
    var background: Color
    var isDisbaled: Bool?
    
    func makeBody(configuration: Configuration) -> some View {
        
        let isButtonDisbaled = isDisbaled ?? false
        
        configuration.label
            .font(.title3.bold())
            .frame(width: frame.width, height: frame.height)
            .background(isButtonDisbaled ? background.opacity(0.8) : background)
            .clipShape(.rect(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.linear(duration: 0.2), value: configuration.isPressed)
    }
}

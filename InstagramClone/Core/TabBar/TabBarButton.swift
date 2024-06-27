//
//  TabBarButton.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct TabBarButton: View {
    
    var imageName: String
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 4) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .clipped()
            }
            .padding(.top, 15)
            .padding(.bottom, 25)
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

#Preview {
    TabBarButton(imageName: "house")
}

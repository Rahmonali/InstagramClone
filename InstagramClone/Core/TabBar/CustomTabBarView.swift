//
//  CustomTabBarView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case uploadPost = 1
    case profile = 2
}

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        
        HStack(alignment: .top) {
            Button {
                selectedTab = .home
            } label: {
                TabBarButton(imageName: selectedTab == .home ? "house.fill" : "house")
                
            }
            .buttonStyle(.plain)
            
            Button {
                selectedTab = .uploadPost
            } label: {
                TabBarButton(imageName: selectedTab == .uploadPost ? "plus.app.fill" : "plus.app")
            }
            .buttonStyle(.plain)
            
            Button {
                selectedTab = .profile
            } label: {
                TabBarButton(imageName: selectedTab == .profile ? "person.circle.fill" : "person.circle")
            }
            .buttonStyle(.plain)
        }
        .foregroundStyle(Color.primary)
        .background(
            GeometryReader { geo in
                Path({ path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                })
                .stroke(Color.primary.opacity(0.1))
            }
        )
        .frame(height: 60)
        .padding(.bottom)
    }
}

#Preview {
    CustomTabBarView(selectedTab: .constant(.home))
}

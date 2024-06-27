//
//  ContentView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var postVM: PostViewModel
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                switch(selectedTab) {
                    case Tabs.home:
                        FeedView()
                    case Tabs.uploadPost:
                        UploadPostView(selectedTab: $selectedTab)
                    case Tabs.profile:
                        CurrentUserProfileView()
                }
                Spacer().frame(height: 0)
                CustomTabBarView(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .preferredColorScheme(.light)
        .onAppear {
            postVM.fetchPost()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PostViewModel())
}

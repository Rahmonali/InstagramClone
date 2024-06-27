//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @EnvironmentObject private var postVM: PostViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ProfileHeaderView()
                
                MediaTypeIcon()
                
                if !postVM.posts.isEmpty {
                    PostGridView()
                } else {
                    VStack(alignment: .center, spacing: 14) {
                        Text("Profile")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("When you share photos and videos, they will appear on you profile")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 60)
                }
            }
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    NavigationStack {
//        CurrentUserProfileView()
//    }
//}

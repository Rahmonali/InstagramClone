//
//  FeedView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct FeedView: View {
    
    @EnvironmentObject var postVM: PostViewModel
    
    var body: some View {
        VStack  {
            if !postVM.posts.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 32) {
                        ForEach(postVM.posts) { post in
                            PostViewCell(post: post, postDetailType: .feed, onDelete: {})
                        }
                    }
                    .padding(.top)
                }
            } else {
                VStack(alignment: .center, spacing: 14) {
                    Spacer()
                    Text("Welcome to Instagram")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Follow people to start seeing the photos and videos they share")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                AdaptiveImage(light: "Instagram_logo_black", dark: "Instagram_logo_white", width: 100, height: 50)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    
                    Button(action: {}, label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .scaledToFit()
                            .foregroundStyle(Color.primary)
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                            .scaledToFit()
                            .foregroundStyle(Color.primary)
                    })
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FeedView()
        .environmentObject(PostViewModel())
}

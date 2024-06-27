//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct PostGridView: View {
    
    @EnvironmentObject var postVM: PostViewModel
    @State private var selectedPost: Post?
    @Environment(\.dismiss) var dismiss
    
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(postVM.posts) { post in
                if let imageData = post.imageData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                        .onTapGesture {
                            selectedPost = post
                        }
                }
            }
        }
        .fullScreenCover(item: $selectedPost) { post in
            PostViewCell(post: post, postDetailType: .profile, onDelete: {
                postVM.deletePost(post: post)
                selectedPost = nil
            })
        }
    }
}

#Preview {
    PostGridView()
        .environmentObject(PostViewModel())
}

//
//  PostInformations.swift
//  InstagramClone
//
//  Created by Rahmonali on 27/06/24.
//

import SwiftUI

struct PostInformations: View {
    @State private var didLike: Bool = false
    @State private var didSave: Bool = false
    
    var post: Post
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                didLike.toggle()
            }, label: {
                Image(systemName: didLike ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(didLike ? .red : .primary)
                    .frame(width: 20, height: 20)
            })
            
            Button(action: {}, label: {
                Image(systemName: "bubble.right")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.primary)
            })
            
            Button(action: {}, label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.primary)
            })
            
            Spacer()
            
            Button(action: {
                didSave.toggle()
            }, label: {
                Image(systemName: didSave ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 10)
                    .foregroundStyle(Color.primary)
            })
            
        }
        .padding(.horizontal, 10)
        
        VStack(alignment: .leading, spacing: 2) {
            Text("777 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            HStack(spacing: 6) {
                Text("rahmonali7")
                    .fontWeight(.semibold)
                Text(post.caption ?? "")
            }
            .font(.footnote)
            
            if let timestamp = post.timestamp {
                Text(timeAgoSinceDate(timestamp))
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.top, 5)
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    PostInformations(post: Post())
}

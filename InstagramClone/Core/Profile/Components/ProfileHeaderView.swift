//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @EnvironmentObject var postVM: PostViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 2) {
                Text("rahmonali7")
                    .font(.title2)
                    .fontWeight(.bold)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
                    .font(.footnote)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Image(systemName: "plus.app")
                    Image(systemName: "line.3.horizontal")
                }
                .font(.title2)
            }
            .padding(.horizontal, 10)
            .padding(.top)
            
            HStack {
                CircularProfileImageView(image: "rahmonali7", size: .large)
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: postVM.posts.count, title: "Posts")
                    UserStatView(value: 700, title: "Followers")
                    UserStatView(value: 60, title: "Following")
                }
                .padding(.trailing)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Rahmonali Fatkhuddinov")
                    .fontWeight(.semibold)                
            }
            .font(.footnote)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ProfileActionButtonView(title: "Edit Profile")
                ProfileActionButtonView(title: "Share Profile")
                ProfileActionButtonIconView(icon: "person.badge.plus")
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    ProfileHeaderView()
        .environmentObject(PostViewModel())
}

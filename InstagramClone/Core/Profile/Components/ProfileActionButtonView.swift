//
//  ProfileActionButtonView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let title: String
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text(title)
                    .font(.footnote)
                    .fontWeight(.semibold)
            })
            .buttonStyle(
                CustomButtonStyle(
                    background: Color(.lightGray).opacity(0.2),
                    foreground: Color.primary, height: 32)
            )
        }
    }
}

#Preview {
    ProfileActionButtonView(title: "Edit Profile")
}

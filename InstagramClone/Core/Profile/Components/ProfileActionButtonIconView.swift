//
//  ProfileActionButtonIconView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct ProfileActionButtonIconView: View {
    let icon: String
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image(systemName: icon)
                    .font(.subheadline)
            })
            .buttonStyle(CustomButtonIconStyle(
                frame: CGSize(width: 40, height: 32),
                background: Color(.lightGray).opacity(0.2))
            )
        }
    }
}

#Preview {
    ProfileActionButtonIconView(icon: "person.badge.plus")
}

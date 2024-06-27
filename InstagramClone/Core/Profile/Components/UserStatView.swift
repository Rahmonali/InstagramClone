//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int?
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value ?? 0)")
                .fontWeight(.semibold)
                           
            Text(title)
        }
        .font(.subheadline)
        .opacity(value == 0 ? 0.5 : 1.0)
        .frame(width: 80, alignment: .center)
        
    }
}

#Preview {
    UserStatView(value: 1, title: "Post")
}

//
//  MediaTypeIcon.swift
//  InstagramClone
//
//  Created by Rahmonali on 27/06/24.
//

import SwiftUI

struct MediaTypeIcon: View {
    let mediaTypeIcon = ["squareshape.split.3x3", "play.rectangle", "person.crop.square"]
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(mediaTypeIcon, id: \.self) { img in
                Image(systemName: img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Spacer()
            }
        }
        .foregroundColor(Color.primary)
        .padding(.top, 10)
        .padding(.bottom, 5)
    }
}

#Preview {
    MediaTypeIcon()
}

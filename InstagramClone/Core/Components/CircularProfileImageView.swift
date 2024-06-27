//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    
    var dimention: CGFloat {
        switch self {
            case .xxSmall:
                return 28
            case .xSmall:
                return 36
            case .small:
                return 48
            case .medium:
                return 64
            case .large:
                return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let image: String
    let size: ProfileImageSize
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: size.dimention, height: size.dimention)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(image: "rahmonali7", size: .large)
}

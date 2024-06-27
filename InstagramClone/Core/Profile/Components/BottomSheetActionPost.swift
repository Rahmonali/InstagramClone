//
//  BottomSheetActionPost.swift
//  InstagramClone
//
//  Created by Rahmonali on 27/06/24.
//

import SwiftUI

struct BottomSheetActionPost: View {
    var onDelete: () -> Void
    var onEdit: () -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                onEdit()
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
            }
            .tint(Color.primary)
            
            Divider()
            
            Button {
                onDelete()
            } label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
            }
            .tint(Color.red)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(.lightGray).opacity(0.2))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
    }
}

#Preview {
    BottomSheetActionPost(onDelete: {}, onEdit: {})
        .environmentObject(PostViewModel())
}

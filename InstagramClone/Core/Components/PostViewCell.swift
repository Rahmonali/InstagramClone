//
//  PostViewCell.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

struct PostViewCell: View {
    
    @State private var showAction: Bool = false
    @State private var isEditing: Bool = false
    @State private var newCaption: String = ""
    @EnvironmentObject private var postVM: PostViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focusedField: FocusedField?
    
    var post: Post
    var postDetailType: PostDetailType
    var onDelete: () -> Void
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                if isEditing {
                    saveButton
                }
                
                HStack {
                    CircularProfileImageView(image: "rahmonali7", size: .xSmall)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Text("rahmonali7")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.primary)
                            
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                                .font(.caption)
                            
                            Spacer()
                            
                            if postDetailType == .profile {
                                actionButton
                            }
                        }
                        Text("Dushanbe, Tajikistan")
                            .font(.caption)
                    }
                }
                .padding(.horizontal, 10)
                
                if let imageData = post.imageData, let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 360)
                        .clipped()
                        .contentShape(Rectangle())
                }
                
                if !isEditing {
                    PostInformations(post: post)
                } else {
                    VStack {
                        TextField("Write a caption", text: $newCaption)
                            .font(.callout.weight(.semibold))
                            .foregroundStyle(Color.primary.opacity(0.8))
                            .autocorrectionDisabled()
                            .focused($focusedField, equals: .caption)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1.5)
                            }
                            .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    .onAppear(perform: {
                        newCaption = post.caption ?? ""
                    })
                }
            }
            
            if postDetailType == .profile && !isEditing {
                dismissButton
            }
        }
        .sheet(isPresented: $showAction, content: {
            BottomSheetActionPost(onDelete: onDelete, onEdit: {
                isEditing = true
            })
            .presentationDetents([.height(120)])
        })
    }
}

extension PostViewCell {
    private var saveButton: some View {
        HStack {
            Button(action: {
                postVM.editPost(post: post, newCaption: newCaption)
                isEditing = false
            }, label: {
                Text("Save")
            })
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var dismissButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "x.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 16)
                .padding(.top, 10)
        })
        .tint(Color.primary)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    private var actionButton: some View {
        Button {
            showAction.toggle()
        } label: {
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .padding(.horizontal, 16)
        }
        .tint(Color.primary)
    }
}

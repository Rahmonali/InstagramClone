//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

enum FocusedField {
    case caption
}

struct UploadPostView: View {
    
    @State private var showImagePicker = false
    @FocusState private var focusedField: FocusedField?
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var postVM: PostViewModel
    @Binding var selectedTab: Tabs
    
    var body: some View {
        VStack(spacing: 20) {
            if postVM.image != nil {
                VStack {
                    postVM.image!
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                        .onTapGesture {
                            self.showImagePicker.toggle()
                        }
                }
            } else {
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(.gray)
                    Text("Select Image", comment: "Select Image Button")
                }
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .background(Color(.lightGray).opacity(0.3))
                .onTapGesture {
                    self.showImagePicker.toggle()
                }
            }
            
            TextField("Write a caption", text: $postVM.caption)
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
            
                .sheet(isPresented: $showImagePicker, onDismiss: postVM.loadImage) {
                    ImagePicker(image: $postVM.postImage)
                }
            
            Spacer()
        }
        .navigationTitle("New Post")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    postVM.addPost()
                    selectedTab = .home
                }, label: {
                    Text("Post")
                    
                })
                .disabled(!postVM.isValid())
            }
        }
        .padding(.top)
    }
}

#Preview {
    NavigationStack {
        UploadPostView(selectedTab: .constant(.uploadPost))
            .environmentObject(PostViewModel())
    }
}

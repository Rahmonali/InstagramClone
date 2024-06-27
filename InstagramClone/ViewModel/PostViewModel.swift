//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by Rahmonali on 26/06/24.
//

import SwiftUI
import CoreData

class PostViewModel: ObservableObject {
    
    let coreDataManager: CoreDataManager
    
    @Published var caption: String = ""
    @Published var image: Image?
    @Published var postImage: UIImage?
    @Published var posts: [Post] = []
    
    init() {
        coreDataManager = CoreDataManager.shared
    }
    
    func addPost() {
        let post = Post(context: coreDataManager.persistentContainer.viewContext)
        post.id = UUID()
        post.caption = caption
        post.imageData = postImage?.jpegData(compressionQuality: 1.0)
        post.timestamp = Date()
        
        coreDataManager.save()
        fetchPost() 
        resetAddPost()
    }
    
    func resetAddPost() {
        caption = ""
        image = nil
    }
    
    func loadImage() {
        guard let inputImage = postImage else { return }
        self.image = Image(uiImage: inputImage)
    }
    
    func fetchPost() {
        self.posts = coreDataManager.getAllPosts()
    }
    
    func editPost(post: Post, newCaption: String) {
        post.caption = newCaption
        coreDataManager.save()
        fetchPost()
    }
    
    func deletePost(post: Post) {
        coreDataManager.delete(post: post)
        coreDataManager.save()
        fetchPost()
    }
    
    func isValid() -> Bool {
        if caption != "" && image != nil {
            return true
        }
        return false
    }
    
}


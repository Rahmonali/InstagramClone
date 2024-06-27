//
//  CoreDataManager.swift
//  InstagramClone
//
//  Created by Rahmonali on 26/06/24.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "InstagramModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to initialize Core Data: \(error)")
            }
        }
    }
    
    func getAllPosts() -> [Post] {
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        let sort = NSSortDescriptor(keyPath: \Post.timestamp, ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func delete(post: Post) {
        persistentContainer.viewContext.delete(post)
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("DEBUG: Failed to save data")
        }
    }
    
}

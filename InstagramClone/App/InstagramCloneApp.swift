//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Rahmonali on 25/06/24.
//

import SwiftUI

@main
struct InstagramCloneApp: App {
    
    @StateObject private var postVM = PostViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(postVM)
        }
    }
}

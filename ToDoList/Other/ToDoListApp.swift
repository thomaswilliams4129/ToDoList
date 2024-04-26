//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

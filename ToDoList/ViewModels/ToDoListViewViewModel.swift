//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import FirebaseFirestore
import Foundation

/// ViewModel for the whole list view
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showNewItemView = false

    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var todoItem = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, todoItem: todoItem, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        // add error messages
        guard !todoItem.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // keep user from picking past days
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}

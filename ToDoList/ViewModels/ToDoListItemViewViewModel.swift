//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
/// ViewModel for a single to do list item (each item in row)
class ToDoListItemViewViewModel: ObservableObject {
    
    init() { }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Could not find current User")
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}

//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let todoItem: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

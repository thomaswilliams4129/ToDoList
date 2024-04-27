//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import Foundation

/// ViewModel for the whole list view
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showNewItemView = false

    init() { }
}

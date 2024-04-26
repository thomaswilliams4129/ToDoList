//
//  User.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

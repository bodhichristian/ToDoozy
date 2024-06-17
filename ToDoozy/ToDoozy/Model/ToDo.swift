//
//  ToDo.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import Foundation
import SwiftData

@Model
class ToDo {
    let id = UUID()
    let dateCreated = Date()
    var title: String
    var dueDate: Date?
    var isComplete: Bool = false
    var details: String? = nil
    
    var list: ToDoList?
    
    init(title: String, list: ToDoList? = nil) {
        self.title = title
        self.list = list
    }
}

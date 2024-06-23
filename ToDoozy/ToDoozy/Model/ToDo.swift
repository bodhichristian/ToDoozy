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
    var id: UUID
    var dateCreated: Date
    var title: String
    var dueDate: Date?
    var isComplete: Bool
    var details: String
    
    var list: ToDoList?
    
    init(title: String, dueDate: Date? = nil, details: String = "", list: ToDoList? = nil) {
        self.id = UUID()
        self.dateCreated = Date()
        self.title = title
        self.dueDate = dueDate
        self.isComplete = false
        self.details = details
        self.list = list
    }
}

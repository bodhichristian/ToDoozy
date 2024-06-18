//
//  ToDoList.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import Foundation
import SwiftData

@Model
class ToDoList {
    var id: UUID
    var dateCreated: Date
    var title: String
    var iconName: String
    @Relationship(deleteRule: .cascade, inverse: \ToDo.list) var toDos: [ToDo] = []
    
    init(title: String) {
        self.id = UUID()
        self.dateCreated = Date()
        self.title = title
        self.iconName = "list.bullet.circle.fill"
        self.toDos = []
    }
}

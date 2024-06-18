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
    let id = UUID()
    var dateCreated = Date()
    var title: String
    var iconName: String = "list.bullet.rectangle.fill"
    var toDos: [ToDo] = []
    
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(to newTitle: String) {
        self.title = newTitle
    }
}

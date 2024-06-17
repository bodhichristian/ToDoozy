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
    var iconName: String = "list.bullet.rectangle"
    var toDos: [ToDo] = []
    
    init(title: String) {
        self.title = title
    }
}
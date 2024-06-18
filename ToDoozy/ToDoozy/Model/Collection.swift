//
//  SmartList.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import Foundation

enum Collection: Identifiable, CaseIterable, Hashable {
    case all, complete, upcoming
    case userLists(ToDoList)
    
    var id: String {
        switch self {
        case .all:
            "all"
        case .complete:
            "done"
        case .upcoming:
            "upcoming"
        case .userLists(let toDoList):
            toDoList.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all:
            "To-Do's"
        case .complete:
            "Complete"
        case .upcoming:
            "Upcoming"
        case .userLists(let toDoList):
            toDoList.title
        }
    }
    
    var iconName: String {
        switch self {
        case .all:
            "checklist"
        case .complete:
            "checkmark.circle"
        case .upcoming:
            "calendar.badge.clock"
        case .userLists(let toDoList):
            toDoList.iconName
        }
    }
    
    static var allCases: [Collection] {
        [.all, .complete, .upcoming]
    }
    
    static func == (lhs: Collection, rhs: Collection) -> Bool {
        lhs.id == rhs.id
    }
}

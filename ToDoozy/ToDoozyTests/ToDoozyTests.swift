//
//  ToDoozyTests.swift
//  ToDoozyTests
//
//  Created by christian on 6/17/24.
//

import Testing
@testable import ToDoozy

struct ToDoozyTests {

    @Test func toDoModelInit() {
        let title = "New To-Do"
        let toDo = ToDo(title: title)
        
        #expect(toDo.title == title)
        #expect(toDo.isComplete == false)
        #expect(toDo.dueDate == nil)
        #expect(toDo.dateCreated != nil)
        #expect(toDo.list == nil)
        #expect(toDo.details.isEmpty)
    }
}

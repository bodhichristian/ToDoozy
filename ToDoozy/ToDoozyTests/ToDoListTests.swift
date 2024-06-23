//
//  ToDoListTests.swift
//  ToDoozyTests
//
//  Created by christian on 6/23/24.
//

import Testing
@testable import ToDoozy

struct ToDoListTests {

    @Test func toDoListModelInit() {
        let title = "New list"
        let list = ToDoList(title: title)
        
        #expect(list.title == title)
        #expect(list.toDos.isEmpty)
        #expect(list.dateCreated != nil)
    }

}

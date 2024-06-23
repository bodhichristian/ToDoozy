//
//  ToDoozyTests.swift
//  ToDoozyTests
//
//  Created by christian on 6/17/24.
//

import Testing
@testable import ToDoozy

struct ToDoTests {

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
    
    @Test func toDoModelMutable() {
        let originalTitle = "New To-Do"
        let toDo = ToDo(title: originalTitle)
        
        // MARK: Mutate each model parameter
        // Omit the list parameter as it is a value handled by SwiftData directly.
        
        // title
        let newTitle = "New Title"
        toDo.title = newTitle
        #expect(toDo.title == newTitle)
        
        // iscomplete
        toDo.isComplete.toggle()
        #expect(toDo.isComplete == true)
        
        // details
        #expect(toDo.details.isEmpty)
        let details = "Get this done ASAP."
        toDo.details = details
        #expect(toDo.details == details)

    }
}





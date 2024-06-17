//
//  ToDoListView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI

struct ToDoListView: View {
    @Binding var toDoList: ToDoList
    
    @State private var selectedToDo: ToDo? = nil
    @State private var showingInspector = false
    
    var body: some View {
        ForEach(toDoList.toDos) { toDo in
            ToDoView(toDo: <#T##Binding<ToDo>#>, selectedToDo: <#T##Binding<ToDo?>#>, showingInspector: <#T##Binding<Bool>#>)
        }
    }
}

#Preview {
    ToDoListView(toDoList: .constant(ToDoList(title: "List")))
}

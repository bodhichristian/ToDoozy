//
//  SidebarView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct SidebarView: View {
    @Binding var selection: Collection?
    @Environment(\.modelContext) private var modelContext
    @Query var lists: [ToDoList]
    
    @FocusState private var titleFieldFocused
    @State private var creatingNewList = false
    @State private var newListTitle = "New List"
    
    var body: some View {
        List(selection: $selection) {
            Section  {
                ForEach(Collection.allCases) { list in
                    Label(list.displayName, systemImage: list.iconName)
                        .tag(list)
                }
            }
            
            Section("My Lists") {
                ForEach(lists, id: \.id) { list in
                    Label(list.title, systemImage: list.iconName)
                        .tag(Collection.userLists(list))
                        .contextMenu {
                            Button("New List") {
                                draftNewList()
                            }
                            Button("Delete \"\(list.title)\"", role: .destructive) {
                                deleteList(list)
                            }
                        }
                }
                
                if creatingNewList {
                    HStack {
                        Image(systemName: "list.bullet.circle.fill")
                            .foregroundStyle(.blue)
                            .offset(x: 3)
                        TextField("New List", text: $newListTitle)
                            .textFieldStyle(.plain)
                            .focused($titleFieldFocused)
                            .offset(x: 1)
                    }
                    .onChange(of: titleFieldFocused) {
                        if !titleFieldFocused {
                            addList()
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                draftNewList()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "plus.circle")
                    
                    Text("New List")
                }
                .font(.headline)
                .fontWeight(.medium)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .keyboardShortcut(KeyEquivalent("n"), modifiers: [.shift, .command])
            .buttonStyle(.borderless)
            .foregroundStyle(.blue)
            .padding(.leading, 12)
            .padding(.bottom, 8)
        }
    }
    
    func draftNewList() {
        withAnimation{
            creatingNewList = true
            titleFieldFocused = true
        }
    }
    
    func addList() {

        withAnimation{
            let newList = ToDoList(title: newListTitle)
            modelContext.insert(newList)
            creatingNewList = false
            newListTitle = "New List"
        }
    }
    
    private func deleteList(_ list: ToDoList) {
        withAnimation {
            modelContext.delete(list)
        }
    }
}

#Preview {
    SidebarView(selection: .constant(nil))
        .listStyle(.sidebar)
}

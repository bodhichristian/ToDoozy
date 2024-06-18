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
    @Query private var userLists: [ToDoList]
    
    var body: some View {
        List(selection: $selection) {
            Section  {
                ForEach(Collection.allCases) { list in
                    Label(list.displayName, systemImage: list.iconName)
                        .tag(list)
                }
            }
            
            Section("My Lists") {
                ForEach(userLists) { list in
                    Label(list.title, systemImage: list.iconName)
                        .tag(Collection.userLists(list))
                        .contextMenu {
                            Button("New List") {
                                addList()
                            }
                            Button("Delete \"\(list.title)\"", role: .destructive) {
                                deleteList(list)
                            }
                        }
                }
            }

        }
        .safeAreaInset(edge: .bottom) {
            Button {
                addList()
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
    
    func addList() {
        let newList = ToDoList(title: "New List")
        modelContext.insert(newList)
    }
    
    private func deleteList(_ list: ToDoList) {
        withAnimation {
            modelContext.delete(list)
        }
    }
}
//
//#Preview {
//    SidebarView(
//        userLists: .constant(TaskList.examples),
//        selection: .constant(TaskCategory.all)
//    )
//    .listStyle(.sidebar)
//}

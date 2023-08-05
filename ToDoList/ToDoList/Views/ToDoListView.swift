//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {
                    item in ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Xoá") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)

                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Công Việc")
            .toolbar {
                Button {
                    // action
                    viewModel.showingNewItemView = true
                } label: {
                     Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}

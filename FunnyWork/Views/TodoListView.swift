//
//  TodoListView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel : TodoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
   
    init (userId: String){
      
        //user
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    TodoListItemsView(item:item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                                
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("Work List")
                .toolbar{
                    Button{
                        viewModel.showingNewItemView = true
                    }label: {
                        Image(systemName:"plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView ){
                    NewItemsView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}

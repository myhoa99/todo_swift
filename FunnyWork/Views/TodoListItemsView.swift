//
//  TodoListItemsView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct TodoListItemsView: View {
    @StateObject var  viewModel = TodoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
     
        HStack{
            VStack(alignment: .leading){
                Text(item.title).bold().font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))") .font(.footnote)
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemsView(item: .init(
            id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false
        ))
    }
}

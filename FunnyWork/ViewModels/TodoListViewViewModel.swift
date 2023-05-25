//
//  TodoListViewViewModel.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//
import FirebaseFirestore
import Foundation
class TodoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
        
    }
    func delete (id: String  ){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

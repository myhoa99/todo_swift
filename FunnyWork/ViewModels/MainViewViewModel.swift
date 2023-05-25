//
//  MainViewViewModel.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//
import FirebaseAuth
import Foundation
class MainViewViewMode: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

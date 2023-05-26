//
//  ContentView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewMode()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
           accountView
        } else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage:"person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

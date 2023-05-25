//
//  ProfileView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else
                {
                    Text("Loading Profile......")
                }
                
            }.navigationTitle("Profile")
           
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
        VStack(alignment: .leading){
            HStack{
                Text("Name :")
                Text(user.name)
            }
            HStack{
                Text("Email :")
                Text(user.email)
            }
            HStack{
                Text("Member Sice:")
                Text("\(Date(timeIntervalSince1970:  user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            
        }.padding(.all , 20)
        
        Button("Log Out"){
            viewModel.logOut()
        }.tint(.red).padding(.all , 10)
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

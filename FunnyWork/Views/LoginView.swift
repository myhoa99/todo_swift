//
//  LoginView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(
                    title: "Funny Work", subTitle: "Get things done", angle: 15, backgound: .pink
                )
                //Login Form
               
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red).textFieldStyle(DefaultTextFieldStyle())
                    }
                    TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    SecureField("PassWord", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButtonView(title: "Log In", background: .blue)  {
                        viewModel.login()
                        
                    }.padding()
                    
            }.offset(y:-50)
                //Creat Account
                VStack{
                    Text("New around here?")
                NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom,50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

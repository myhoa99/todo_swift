//
//  RegisterView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subTitle: "Start organizing works", angle: -15, backgound: .orange)
            Form{
                TextField("Full Name", text: $viewModel.fullname)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
                SecureField("PassWord", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                
                TLButtonView(title: "Register", background: .green)  {
                    viewModel.register()
                    
                }.padding()
                
            }.offset(y:-50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

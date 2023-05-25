//
//  TLButtonView.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let background: Color
    let action:  () -> Void
    var body: some View {
        Button{
            //Attemp log in
            action()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(
                    title
                ).foregroundColor(Color.white).bold()
            }
        }.padding()
    }
}

struct TLButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TLButtonView(title: "", background: .green){
            //action
        }
    }
}

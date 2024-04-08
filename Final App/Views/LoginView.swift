//
//  LoginView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/15/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            Spacer()
            Button {
                
            } label: {
                Text("Sign Out")
                    .foregroundColor(.black)
                    .font(Constants.mediumFont)
                    .frame(width: 300,height: 60)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                    .padding()
                
            }
            
            Button {
                
            } label: {
                Text("Update Picture")
                    .foregroundColor(.black)
                    .font(Constants.mediumFont)
                    .frame(width: 300,height: 60)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                    .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(User())
    }
}

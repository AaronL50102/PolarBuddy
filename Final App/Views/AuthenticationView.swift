//
//  AuthentificationView.swift
//
//  Created by Eliza Liebo (student LM) on 1/30/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

enum ViewStateAuth {
    case signUp, login, auth
}

struct AuthentificationView: View {
    
    @State var viewState: ViewStateAuth = .auth
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.blueish)
                .ignoresSafeArea()
            VStack{
                if viewState == .signUp {
                    SignUpView()
                }
                else if viewState == .login {
                    LoginView()
                }
                
                Spacer()
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
                Spacer()
                Button {
                    viewState = .signUp
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.white.opacity(1))
                            .cornerRadius(20)
                            .padding(.all, 5)
                            .frame(width: 300, height: 60)
                        Text("Sign Up")
                            
                    }
                }.padding()
                
                Button {
                    viewState = .login
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.white.opacity(1))
                            .cornerRadius(20)
                            .padding(.all, 5)
                            .frame(width: 300, height: 60)
                        Text("Login")
                        
                    }
                    
                }.padding()
                Spacer()
            }
            
        }
        
    }
}

struct AuthentificationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentificationView()
            .environmentObject(User())
    }
}

//
//  SignUpView.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 2/1/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack{
            //Rectangle()
                //.foregroundColor(.blue)
                //.ignoresSafeArea()
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                TextField("email address", text: $user.emailAddress)
                    .padding()
                    .foregroundColor(.white)
                SecureField("password", text: $user.password)
                    .padding()
                Spacer()
                
                Button {
                    Auth.auth().createUser(withEmail: user.emailAddress, password: user.password){user, error in
                        if let _ = user{
                            self.user.subscribe = true
                            print("successfully logged in!!")
                        } else if let e = error {
                            print(e.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding(.horizontal, 100)
                        .padding(.vertical, 10)
                        .background(Color.blueish)
                        .cornerRadius(20)
                }
                Spacer()
 
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(User())
    }
}

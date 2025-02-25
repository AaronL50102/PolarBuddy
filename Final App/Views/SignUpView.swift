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
    @State var logoAppear: Double = 0.01
    @State var viewOpacity: Double = 0.0
    
    var body: some View {
        ZStack{
            Image("blueBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(1.3)
                .opacity(0.2)
            VStack{
                Spacer()
                
                ZStack{
                    TextField("email address", text: $user.emailAddress)
                        .padding([.leading, .trailing], 110)
                        .padding(20)
                        .foregroundColor(.black)
                        .scaleEffect(1.6)
                    Rectangle()
                        .frame(width: 270, height: 1)
                        .foregroundColor(Color.gray)
                        .opacity(0.5)
                        .offset(y: 20)
                }
                .opacity(viewOpacity)
                .onAppear{
                    withAnimation (.easeIn(duration: 0.2)){
                        self.viewOpacity = 1
                    }
                }
                ZStack{
                    SecureField("password", text: $user.password)
                        .padding([.leading, .trailing], 110)
                        .padding(20)
                        .foregroundColor(.black)
                        .scaleEffect(1.6)
                    Rectangle()
                        .frame(width: 270, height: 1)
                        .foregroundColor(Color.gray)
                        .opacity(0.5)
                        .offset(y: 20)
                }
                .opacity(viewOpacity)
                .onAppear{
                    withAnimation (.easeIn(duration: 0.5)){
                        self.viewOpacity = 1
                    }
                }
                Spacer()
                Spacer()
                Button {
                    Auth.auth().createUser(withEmail: user.emailAddress, password: user.password){user, error in
                        if let u = user{
                            self.user.getUserData()
                            self.user.subscribe = true
                            self.user.loggedIn = true;
                            print("successfully signed up!!")
                            self.user.getUserData()
                        } else if let e = error {
                            print(e.localizedDescription)
                        }
                    }
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .frame(width: 300,height: 60)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .padding()
                        .opacity(viewOpacity)
                        .onAppear{
                            withAnimation (.easeIn(duration: 0.5)){
                                self.viewOpacity = 1
                            }
                        }
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

//                        .foregroundColor(.white)
//                        .padding(.horizontal, 100)
//                        .padding(.vertical, 10)
//                        .background(Color.blue)
//                        .cornerRadius(20)

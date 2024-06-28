//
//  StartView.swift
//  Final App
//
//  Created by Matthew Hartstein (student LM) on 4/3/24.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var user: User
    @State var logoAppear: Double = 0.01
    @State var viewOpacity: Double = 0.0
    
    var body: some View {
        VStack {
            if user.loggedIn {
                ContentView()
                    
            } else{
                NavigationStack{
                    ZStack{
                        Image("blueBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                        VStack{
                            Spacer()
                            Image("realLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(logoAppear)
                                .onAppear {
                                    withAnimation(.spring(dampingFraction: 0.3)) {
                                        self.logoAppear = 1
                                    }
                                }
                            NavigationLink(destination: {
                                SignUpView()

                            }, label: {
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                    .frame(width: 300,height: 60)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                    .padding()
                                    .opacity(viewOpacity)
                                    .onAppear{
                                        withAnimation (.easeIn(duration: 0.5).delay(2)){
                                            self.viewOpacity = 1
                                        }
                                    }
                                
                            })
                           
                            NavigationLink(destination: {
                                LoginView()
                            }, label: {
                                Text("Log In")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                    .frame(width: 300,height: 60)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                                    .padding(.bottom, 50)
                                    .opacity(viewOpacity)
                                    .onAppear{
                                        withAnimation (.easeIn(duration: 0.5).delay(2)){
                                            self.viewOpacity = 1
                                        }
                                    }
                                
                            })
                           
                         }
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    struct StartView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
                .environmentObject(User())
        }
    }
}

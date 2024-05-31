//
//  HomeView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI
import Firebase

import FirebaseCore

import FirebaseAuth

import FirebaseDatabase

struct HomeView: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var cart: Cart
    @State var daysOld: Int = 0
 //   @State var points: Int = 60 // Initial value for points
    let maxPoints: Int = 100 // Maximum value for points
    
    var body: some View {
        
        ZStack{
            NavigationView{
                VStack{
                    Spacer()
                    
                    HStack{
                        NavigationLink {
                            StoreView()
                        } label: {
                            HStack{
                                Text("Store")
                                Image(systemName: "cart")
                            }
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.lightBlue)
                            .cornerRadius(20)
                            .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    HStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        ZStack{
                            Image("polar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(2)
                            if user.hasHat {
                                Image("hat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.42)
                                .offset(x: 5, y: -150)
                            }
                            if user.hasScarf {
                                Image("scarf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.6)
                                .offset(x: 5, y: -50)
                            }
                            if user.hasGlasses {
                                Image("glasses")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.34)
                                .offset(x: 5, y: -115)
                            }
                            
                        }
                        ZStack {
                            Rectangle()
                                .frame(width: 35, height: 320)
                                .foregroundColor(.lightBlue)
                                .cornerRadius(50)
                                .padding()
                            
                            Rectangle()
                                .frame(width: 35, height: CGFloat(320 * (CGFloat(user.points) / CGFloat(maxPoints))))
                                .foregroundColor(.blueish)
                                .cornerRadius(50)
                                .padding(.top, CGFloat(320 * (1 - (CGFloat(user.points) / CGFloat(maxPoints)))))
                                .offset(y: CGFloat((320 - (320 * (CGFloat(user.points) / CGFloat(maxPoints))))) / 2)
                            
                            Image("star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.4)
                                .offset(x: 0, y: -200)
                        }
                    }
                    Spacer()
                    TextField("Name", text: $user.name)
                        .padding()
                        .font(Constants.largeFont)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueish)
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Store())
            .environmentObject(User())
            .environmentObject(Cart())
    }
}

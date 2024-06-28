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
        NavigationStack{
            
            ZStack{
                Image("blueBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                VStack{
                    Spacer()
                    Text("PolarBuddy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink {
                            StoreView()
                        } label: {
                            HStack{
                                Text("Store")
                                    .font(.system(size: 24))
                                Image(systemName: "cart")
                                    .font(.system(size: 24))
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.darkBlue)
                            .cornerRadius(30)
                            
                        }
                        
                        Spacer()
                        Spacer()
                        
                        
                        NavigationLink {
                            InstructionsView()
                            
                        } label: {
                            HStack{
                                Image(systemName: "questionmark.circle.fill")
                                    .foregroundColor(.darkBlue)
                                    .font(.system(size: 59))
                                
                            }
                            
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    
                    HStack{
                        Spacer()
                        ZStack{
                            if user.hasIceberg {
                                Image("iceberg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(1.3)
                                    .offset(x: 8, y: 120)
                            }
                            
                            if user.hasFlowers {
                                Image("flowers")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(1.2)
                                    .offset(x: 8, y: 40)
                            }
                            
                            Image("polar")
                            
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                
                                .frame(width: 200, height: 400)
                                .padding()
                                .hueRotation(Angle(degrees: 80))
                            
                            if user.hasHat {
                                Image("hat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.42)
                                    .offset(x: 7, y: -137)
                              
                            }
                            
                            if user.hasScarf {
                                Image("scarf")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.65)
                                    .offset(x: 5, y: -50)
                            }
                            
                            if user.hasGlasses {
                                Image("glasses")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.34)
                                    .offset(x: 5, y: -110)
                            }
                            
                            if user.hasBag {
                                Image("louisBag")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.56)
                                    .offset(x: 8, y: 30)
                            }
                            
                            if user.hasSkirt {
                                Image("skirt")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(1)
                                    .offset(x: 0, y: 60)
                               
                            }
                            if user.hasWatch {
                                Image("watch")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.3)
                                    .offset(x: 30, y: -5)
                             
                            }
                            if user.hasNecklace {
                                Image("necklace")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.6)
                                    .offset(x: 2, y: -30)
                            }
                           
                        }
//                        Spacer()
                        VStack{
                            Image("star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 125.0, height: 125.0)
                            ZStack{
                                Rectangle()
                                    .frame(width: 40, height: 325)
                                    .foregroundColor(.black)
                                    .cornerRadius(50)
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .frame(width: 35, height: 320)
                                        .foregroundColor(.lightBlue)
                                        .cornerRadius(50)
                                    
                                    Rectangle()
                                        .frame(width: 35, height: CGFloat(320 * (CGFloat(user.points) / CGFloat(maxPoints))))
                                        .foregroundColor(.lightMediumBlue)
                                        .cornerRadius(50)
                                    
                                }
                            }
                        }
                       Spacer()
                    }
                    
                    Spacer()
                    TextField("Name", text: $user.name)
                        .padding()
                        .font(Constants.largeFont)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueish)
                    Spacer()
                }
                
//                .padding()
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

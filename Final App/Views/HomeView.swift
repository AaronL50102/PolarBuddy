//
//  HomeView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var user: User
    @EnvironmentObject var cart: Cart
    @State var daysOld: Int = 0
    @State var points: Int = 0
    
    var body: some View {
        
        ZStack{
            NavigationView{
                VStack{
                    Spacer()
                    
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
                    Spacer()
                    HStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Image("polar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                           
                            ZStack{
                                Rectangle()
                                    .frame(width: 35, height: 320)
                                    .foregroundColor(.lightBlue)
                                    .cornerRadius(50)
                                    .padding()
                               
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

//
//  HomeView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var user: User
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
                            .foregroundColor(.lightBlue)
                            .padding()
                            .background(Color.blueish)
                            .cornerRadius(20)
                            .padding()
                        
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    Image("polar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    Spacer()
                    TextField("Name", text: $user.polarName)
                        .padding()
                        .font(Constants.largeFont)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueish)
                 
                    Spacer()
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
    }
}

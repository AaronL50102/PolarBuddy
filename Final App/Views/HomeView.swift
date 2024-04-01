//
//  HomeView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI

struct HomeView: View {
    
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
                        Text("Store")
                            .foregroundColor(.lightBlue)
                            .padding()
                            .padding()
                            .background(Color.blueish)
                            .cornerRadius(20)
                            .padding()
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    Text("Polar Bear")
                        .font(Constants.largeFont)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.blueish)
                    Spacer()
                    Spacer()
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
    }
}

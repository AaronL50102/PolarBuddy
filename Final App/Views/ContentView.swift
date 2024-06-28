//
//  ContentView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/8/24.
//

import SwiftUI

enum ViewState {
    case home, info, report, input
}

struct ContentView: View {
    
    @State var viewState: ViewState = .home
    @State var test: Int = 1 //Remove later
    @State var logoAppear: Double = 0.01
    @State var viewOpacity: Double = 0.0
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ChallengeView()
                .tabItem {
                    Label("Tasks", systemImage: "book")
                }
            InputView()
                .tabItem {
                    Label("Input", systemImage: "camera")
                }
            ReportView()
                .tabItem {
                    Label("Info", systemImage: "pencil")
                }
            
            
        }
        
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .white
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            } else {
                // Fallback on earlier versions
            }
            withAnimation (.easeIn(duration: 0.5).delay(0)){
                self.viewOpacity = 1
            }
        })
       
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store())
            .environmentObject(User())
            .environmentObject(FactsModel())
    }
}


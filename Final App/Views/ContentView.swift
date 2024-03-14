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
    
    var body: some View {
        VStack {
            Spacer()
            if viewState == .home {
                HomeView()
            }
            else if viewState == .info {
                InfoView()
            }
            else if viewState == .input{
                InputView()
            }
            else{
                ReportView()
            }
            Spacer()
            HStack {
                Button {
                    viewState = .home
                } label: {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                Spacer()
                Button {
                    viewState = .info
                } label: {
                    VStack{
                        Image(systemName: "pencil")
                        Text("Info")
                    }
                }
                Spacer()
                Button {
                    viewState = .input
                } label: {
                    VStack{
                        Image(systemName: "camera")
                        Text("Input")
                    }
                }
                Spacer()
                Button {
                    viewState = .report
                } label: {
                    VStack{
                        Image(systemName: "person")
                        Text("report")
                    }
                }

            }.padding([.leading, .trailing, .top], 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environmentObject(Home())
//            .environmentObject(Info())
//            .environmentObject(Input())
//            .environmentObject(Report())
    }
}

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
//            ZStack{
//                Circle()
//                    .foregroundColor(Color.mediumBlue)
//                    .frame(width: 90, height: 90)
//                Rectangle()
//                    .cornerRadius(30)
//                    .foregroundColor(Color.mediumBlue)
//                    .frame(height: 50)
                HStack {
                    Button {
                        viewState = .home
                    } label: {
                        VStack{
                            Spacer()
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                    Spacer()
                    Button {
                        viewState = .info
                    } label: {
                        VStack{
                            Spacer()
                            Image(systemName: "pencil")
                            Text("Info")
                        }
                    }
                    Spacer()
                    Button {
                        viewState = .input
                    } label: {
                        VStack{
                            Spacer()
                            Image(systemName: "camera")
                            Text("Input")
                        }
                    }
                    Spacer()
                    Button {
                        viewState = .report
                    } label: {
                        VStack{
                            Spacer()
                            Image(systemName: "person")
                            Text("Report")
                        }
                    }
                    
                }.padding([.leading, .trailing, .top], 20)
            }
            .padding()
//        }
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

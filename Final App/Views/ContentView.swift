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
            ZStack{
//                Circle()
//                    .frame(width: 90, height: 90)
//                    .foregroundColor(Color.mediumBlue)
                ExtractedView()
                HStack {
                    Button {
                        viewState = .info
                    } label: {
                        VStack{
                            Image(systemName: "pencil")
                            Text("Info")
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        viewState = .home
                    } label: {
                        VStack{
                            Image(systemName: "house")
                            Text("Home")
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        viewState = .input
                    } label: {
                        VStack{
                            Image(systemName: "camera")
                            Text("Input")
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        viewState = .report
                    } label: {
                        VStack{
                            Image(systemName: "person")
                            Text("Report")
                        }
                        .foregroundColor(.white)
                    }
                }.padding([.leading, .trailing, .top], 20)
            }
        }
        .padding()
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

//somehow a ZStack a single rectangle affects the HStack of buttons. I lost my mind for 30 minutes over this but hey I found a solution
struct ExtractedView: View {
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: -90, y: -6)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: 90, y: -6)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: -90, y: 34)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: 90, y: 34)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: -90, y: 74)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.mediumBlue)
            .offset(x: 90, y: 74)
    }
}

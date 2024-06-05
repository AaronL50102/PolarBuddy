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
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
            else if viewState == .info {
                ChallengeView()
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
            else if viewState == .input{
                InputView()
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
            else{
                ReportView()
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            }
            Spacer()
            ZStack{
                ExtractedView()
                HStack {
                    Button {
                        withAnimation{
                            viewState = .info
                        }
                    } label: {
                        VStack{
                            Image(systemName: "book")
                                .scaleEffect(2)
                            Text("Task")
                                .padding(.vertical, 2)
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        withAnimation{
                            viewState = .home
                        }
                    } label: {
                        VStack{
                            Image(systemName: "house")
                                .scaleEffect(2)
                            Text("Home")
                                .padding(.vertical, 2)
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        withAnimation{
                            viewState = .input
                        }
                    } label: {
                        VStack{
                            Image(systemName: "camera")
                                .scaleEffect(2)
                            Text("Input")
                                .padding(.vertical, 2)
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Button {
                        withAnimation{
                            viewState = .report

                        }
                    } label: {
                        VStack{
                            Image(systemName: "pencil")
                                .scaleEffect(2)
                            Text("Info")
                                .padding(.vertical, 2)
                        }
                        .foregroundColor(.white)
                    }
                }.padding([.leading, .trailing], 40)
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

//somehow a ZStack a single rectangle affects the HStack of buttons. I lost my mind for 30 minutes over this but hey I found a solution (kinda)
struct ExtractedView: View {
    var body: some View {
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: -90, y: -27)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: 90, y: -27)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: -90, y: -6)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: 90, y: -6)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: -90, y: 34)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: 90, y: 34)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: -90, y: 74)
        Rectangle()
            .frame(width: 250, height: 40)
            .foregroundColor(Color.lightMediumBlue)
            .offset(x: 90, y: 74)
    }
}

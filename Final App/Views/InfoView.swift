//
//  InfoView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI


struct InfoView: View {
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                VStack{
                   Spacer()

                    Text("Info")
                        .font(.custom("Helvetica Neue Thin", size: 45))
                        .bold()
                        .foregroundColor(Color.blueish)
                   
                    Spacer()
                    VStack{
                        NavigationLink {
                            FactsView()
                        } label: {
                            ZStack{
                                Image("tree")
                                    .resizable()
                                    .cornerRadius(40)
                                Text("Facts")
                                    .font(.custom("Helvetica Neue Thin", size: 45))
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        Spacer()
                        Spacer()
                        
                        NavigationLink {
                            RecycleView()
                        } label: {
                            ZStack{
                                Image("ocean")
                                    .resizable()
                                    .cornerRadius(40)
                                Text("Recycle")
                                    .font(.custom("Helvetica Neue Thin", size: 45))
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        
                        
                        
                    }.padding(50)
                   Spacer()
                }
            }
            }
        }
    }

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(FactsModel())
    }
}

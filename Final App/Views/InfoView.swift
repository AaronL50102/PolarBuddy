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
                        .foregroundColor(Color.black)
                   
                    Spacer()
                    VStack{
                        NavigationLink {
                            FactsView()
                        } label: {
                            ZStack{
                                Image("emission")
                                    .resizable()
                                    .cornerRadius(40)

                            }
                        }
                        Spacer()
                        Spacer()
                        
                        NavigationLink {
                            RecycleView()
                        } label: {
                            ZStack{
                                Image("recycle")
                                    .resizable()
                                    .cornerRadius(40)
                                Text("Recycle")
                                    .font(.custom("Helvetica Neue Thin", size: 25))
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .offset(x:2, y:-2)
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

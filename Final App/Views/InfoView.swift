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
                    
                    Text("Info")
                        .font(Constants.largeFancyFont)
                        .foregroundColor(Color.blueish)
                    Spacer()
                    HStack{
                        NavigationLink {
                            FactsView()
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 125, height: 125)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.lightBlue)
                                Text("facts")
                                    .foregroundColor(Color.black)
                            }
                        }
                        Spacer()
                        NavigationLink {
                            RecycleView()
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 125, height: 125)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.lightGreen)
                                Text("recycle")
                                    .foregroundColor(Color.black)
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
           
    }
}

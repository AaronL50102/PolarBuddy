//
//  FactsView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/19/24.
//

import SwiftUI

struct FactsView: View {
    
    @EnvironmentObject var factsModel: FactsModel
    
    var body: some View {
        ZStack {
            Image("backgroundImageAgain")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(0.2)
                .scaleEffect(1.5)
                .ignoresSafeArea()
            ScrollView{
                ZStack{
                    Text("CO2 Concentration")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .offset(x:-35,y:-270)
                    
                    Text("on this day")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .bold()
                        .offset(x:-95,y:-220)
                        .multilineTextAlignment(.leading)
                    
                    Image("cloud")
                        .scaleEffect(0.18)
                        .offset(x:50,y:-220)
                    
                    Text("By adding more carbon dioxide to the atmosphere, people are supercharging the natural greenhouse effect, causing global temperature to rise")
                        .font(.custom("Helvetica Neue Thin", size: 15))
                        .offset(x:-5,y:-140)
                        .frame(width: 325,height: 100)
                               
                    VStack{
                        ForEach(factsModel.result.co2) { v in
                            HStack{
                                Spacer()
                                Text("\(v.year)")
                                    .font(.custom("Helvetica Neue Thin", size: 40))
                                    .bold()
                                    .foregroundColor(Color.lightMediumBlue)
                                    .offset(x:0,y:180)
                                Spacer()
                                Text("\(v.trend) ppm ")
                                    .font(.custom("Helvetica Neue Thin", size: 30))
                                    .foregroundColor(Color.mediumBlue)
                                    .cornerRadius(10)
                                    .offset(x:0,y:180)
                                Spacer()
                            }
                        }
                    }
                }.padding()
            }
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
            .environmentObject(FactsModel())
    }
}

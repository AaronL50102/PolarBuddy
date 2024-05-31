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
        VStack{
            VStack{
                Text("CO2 Concentration")
                    .font(.custom("Helvetica Neue Thin", size: 40))
                Text("on this day")
                    .font(.custom("Helvetica Neue Thin", size: 40))
            }
          
            ForEach(factsModel.result.co2) { v in
                HStack{
                    Spacer()
                    Text("\(v.year)")
                        .font(.custom("Helvetica Neue Thin", size: 40))
                        .bold()
                        .foregroundColor(Color.lightMediumBlue)
                    Spacer()
                    Text("\(v.trend) ppm ")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .foregroundColor(Color.mediumBlue)
                        .cornerRadius(10)
                    Spacer()
                }
            }
                
                        
        }.padding()
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
            .environmentObject(FactsModel())
    }
}

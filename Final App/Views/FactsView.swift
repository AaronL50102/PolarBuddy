//
//  FactsView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/19/24.
//

import SwiftUI

struct FactsView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.blueish)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Facts")
                    .font(Constants.largeFancyFont)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                HStack{
                    Rectangle()
                        .foregroundColor(Color.blueish)
                    ZStack{
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                        Text("Enough plastic bottles are discarded over a year to go around the planet 4 times")
                            .font(Constants.smallFancyFont)
                    }
                }
                Spacer()
                
                HStack{
                    ZStack{
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                        Text("More than 90% of our ocean plastics come from just 10 rivers")
                            .font(Constants.smallFancyFont)
                    }
                    Rectangle()
                        .foregroundColor(Color.blueish)
                }
                
                Spacer()
                
                HStack{
                    Rectangle()
                        .foregroundColor(Color.blueish)
                    ZStack{
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                        Text("The largest dumping site of plastics is not a landfill, it is the pacific ocean")
                            .font(Constants.smallFancyFont)
                    }
                }
                
                Spacer()
                
                HStack{
                    ZStack{
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                        Text("The average person creates almost five pounds of trash per day")
                            .font(Constants.smallFancyFont)
                        
                    }
                    Rectangle()
                        .foregroundColor(Color.blueish)
                }
                
            }.padding(20)
            
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
    }
}

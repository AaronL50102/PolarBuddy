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
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Facts")
                    .font(Constants.largeFancyFont)
                    .foregroundColor(Color.blueish)
                
                Spacer()
                
                Text("Enough plastic bottles are discarded over a year to go around the planet 4 times")
                        .font(Constants.smallFancyFont)
                        .frame(width: 325,height: 125)
                        .background(Color.lightBlue)
                        .cornerRadius(20)
                    
            
                Spacer()
                
                Text("More than 90% of our ocean plastics come from just 10 rivers")
                        .font(Constants.smallFancyFont)
                        .frame(width: 325,height: 125)
                        .background(Color.lightGreen)
                        .cornerRadius(20)
                    

                
                Spacer()


                Text("The largest dumping site of plastics is not a landfill, it is the pacific ocean")
                    .font(Constants.smallFancyFont)
                    .frame(width: 325,height: 125)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                
  
                Spacer()


                Text("The average person creates almost five pounds of trash per day")
                    .font(Constants.smallFancyFont)
                    .frame(width: 325,height: 125)
                    .background(Color.lightGreen)
                    .cornerRadius(20)
      
                
            }.padding(20)
            
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
    }
}

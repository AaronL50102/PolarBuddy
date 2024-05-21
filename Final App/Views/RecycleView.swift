//
//  RecycleView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/19/24.
//

import SwiftUI

struct RecycleView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            
            VStack{
                
                Text("How to Recycle")
                    .font(Constants.mediumFancyFont)
                    .foregroundColor(Color.blueish)
                
                Spacer()
                
                Text("RULE 1: Recycle bottles, cans, paper and cardboard")
                        .font(Constants.smallFancyFont)
                        .frame(width: 325,height: 125)
                        .background(Color.lightBlue)
                        .cornerRadius(20)
                    
            
                Spacer()
                
                Text("RULE 2: Keep food and liquid out of your recycling")
                        .font(Constants.smallFancyFont)
                        .frame(width: 325,height: 125)
                        .background(Color.lightGreen)
                        .cornerRadius(20)
                Spacer()
                Text("RULE 3: No loose plastic bags and no bagged recyclables")
                    .font(Constants.smallFancyFont)
                    .frame(width: 325,height: 125)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                Spacer()
                Text("RULE 4: Look for bins with this symbol")
                    .font(Constants.smallFancyFont)
                    .frame(width: 325,height: 125)
                    .background(Color.lightGreen)
                    .cornerRadius(20)
      
                
            }.padding(20)
            
        }
    }
}

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
    }
}

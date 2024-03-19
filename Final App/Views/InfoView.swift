//
//  InfoView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI

struct InfoView: View {
    
    
    var body: some View {
            VStack{
               
                Text("Facts")
                
                Spacer()
                
                HStack{
                    Spacer()
                    Text("Enough plastic bottles are discarded over a year to go around the planet 4 times")
                    Spacer()
                    Text("More than 90% of our ocean plastics come from just 10 rivers")
                }
               
                Spacer()
                
                HStack{
                    Text("The largest dumping site of plastics is not a landfill, it is the pacific ocean!")
                    Spacer()
                    Text("The average person creates almost five pounds of trash per day")
           
                    }
                
                Spacer()
                
                HStack{
                    Text("The largest dumping site of plastics is not a landfill, it is the pacific ocean!")
                    Spacer()
                    Text("The average person creates almost five pounds of trash per day")
           
                    }
                
                Spacer()
                
                HStack{
                    Text("The largest dumping site of plastics is not a landfill, it is the pacific ocean!")
                    Spacer()
                    Text("The average person creates almost five pounds of trash per day")
           
                    }
                
            }.padding()
  
    }
}

    
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
           
    }
}

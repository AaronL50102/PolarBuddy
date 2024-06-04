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
            Text("Challenges")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(FactsModel())
    }
}

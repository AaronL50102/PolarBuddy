//
//  InfoHomeView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/20/24.
//

import SwiftUI

struct InfoHomeView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.blueish)
                .ignoresSafeArea()
            Text("facts or recycle")
                .foregroundColor(Color.white)
            
        }
    }
}

struct InfoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        InfoHomeView()
    }
}

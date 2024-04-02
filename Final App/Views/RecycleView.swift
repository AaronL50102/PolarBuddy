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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.black)
        }
    }
}

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
    }
}

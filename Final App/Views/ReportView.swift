//
//  ReportView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct ReportView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.blueish)
                .ignoresSafeArea()
            
            VStack {
                Text("By recycling you have saved ... ")
                    .font(Constants.largeFont)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()

    }
}

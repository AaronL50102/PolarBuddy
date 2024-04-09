//
//  StartView.swift
//  Final App
//
//  Created by Matthew Hartstein (student LM) on 4/3/24.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var user: User

    var body: some View {
        VStack {
            if user.subscribe {
                ContentView()
            } else {
                SignUpView()
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(User())
    }
}

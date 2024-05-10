//
//  InputView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct InputView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                user.addBottle()
                print("\(user.waterBottle)")
            } label: {
                Text("Add Water Bottle")
            }
            
            Spacer()
            
            Button {
                user.addCan()
                print("\(user.aluminumCan)")
            } label: {
                Text("Add Aluminum Can")
            }
            
            Spacer()
            
            Button {
                user.addCardboard()
                print("\(user.cardboard)")
            } label: {
                Text("Add Cardboard")
            }
            
            Spacer()
            
            Button {
                user.addBag()
                print("\(user.groceryBag)")
            } label: {
                Text("Add Grocery Bag")
            }
            
            Spacer()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
            .environmentObject(User())
    }
}

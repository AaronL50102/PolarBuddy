//
//  User.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 12/20/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class User: ObservableObject{
    @Published var name: String = ""
    @Published var age: Int = 18
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var subscribe: Bool = false
    @Published var uid: String = ""
    @Published var loggedIn: Bool = false
    @Published var waterBottle: Int = 0
    @Published var aluminumCan: Int = 0
    @Published var cardboard: Int = 0
    @Published var groceryBag: Int = 0

    init(emailAdress: String = "", password: String = "") {
        self.emailAddress = emailAddress
        self.password = password

        guard let uid = Auth.auth().currentUser?.uid else {return}
        self.uid = uid

        self.loggedIn = true
        self.subscribe = true

        Task {
            guard let n = try? await Database.database().reference().child("users/\(uid)/name").getData() else {return}
            self.name = n.value as? String ?? ""

            guard let a = try? await Database.database().reference().child("users/\(uid)/age").getData() else {return}
            self.age = a.value as? Int ?? 18

            guard let w = try? await Database.database().reference().child("users/\(uid)/waterBottle").getData() else {return}
            self.waterBottle = w.value as? Int ?? 0

            guard let a = try? await Database.database().reference().child("users/\(uid)/aluminumCan").getData() else {return}
            self.aluminumCan = a.value as? Int ?? 0

            guard let c = try? await Database.database().reference().child("users/\(uid)/cardboard").getData() else {return}
            self.cardboard = c.value as? Int ?? 0

            guard let g = try? await Database.database().reference().child("users/\(uid)/groceryBag").getData() else {return}
            self.groceryBag = g.value as? Int ?? 0
        }

    }    

}

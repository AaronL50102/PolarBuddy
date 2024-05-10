//
//  User.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 12/20/23.
//

import SwiftUI
//import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

@MainActor class User: ObservableObject {
    @Published var name: String = ""
    @Published var polarName: String = ""
    @Published var age: Int = 18
    @Published var polarName: String = ""
    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var subscribe: Bool = false
    @Published var uid: String = ""
    @Published var loggedIn: Bool = false
    @Published var waterBottle: Int = 0
    @Published var aluminumCan: Int = 0
    @Published var cardboard: Int = 0
    @Published var groceryBag: Int = 0

    init(emailAdress: String = "", password: String = "", polarName: String = "") {
        self.emailAddress = emailAddress
        self.password = password
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("failed")
            return
            
        }
        self.uid = uid

        self.loggedIn = false
        self.subscribe = false
    }
    
    func co2Emissions() -> Double {
        return Double(self.waterBottle) * 0.84 + Double(self.aluminumCan) * 0.097 + Double(self.cardboard) * 1.81 + Double(self.groceryBag) * 1.58
    }

    func addBottle() -> Void {
        self.waterBottle += 1
        
        // update database
        Database.database().reference().child("user/\(uid)/bottles").setValue(waterBottle)

    }
    
    func addCan() -> Void {
        self.aluminumCan += 1
        
        // update database
        Database.database().reference().child("user/\(uid)/aluminumCan").setValue(aluminumCan)

    }
    
    func addCardboard() -> Void {
        self.cardboard += 1
        
        // update database
        Database.database().reference().child("user/\(uid)/cardboard").setValue(cardboard)

    }
    
    func addBag() -> Void {
        self.groceryBag += 1
        
        // update database
        Database.database().reference().child("user/\(uid)/groceryBag").setValue(groceryBag)

    }
    
    func getUserData() -> Void {
        print("it is being called")
        Task {
            print("running it is")
            guard let n = try? await Database.database().reference().child("user/\(uid)/name").getData() else {return}
            self.name = n.value as? String ?? ""

            guard let a = try? await Database.database().reference().child("user/\(uid)/age").getData() else {return}
            self.age = a.value as? Int ?? 18
            

            guard let p = try? await Database.database().reference().child("user/\(uid)/polarName").getData() else {return}

            self.polarName = p.value as? String ?? ""

            guard let w = try? await Database.database().reference().child("user/\(uid)/bottles").getData() else {
                print("it failed sorry :(")
                return
            }
            self.waterBottle = w.value as? Int ?? 0
            print("updated water bottles to \(self.waterBottle)" )
            guard let a = try? await Database.database().reference().child("user/\(uid)/aluminumCan").getData() else {return}
            self.aluminumCan = a.value as? Int ?? 0

            guard let c = try? await Database.database().reference().child("user/\(uid)/cardboard").getData() else {return}
            self.cardboard = c.value as? Int ?? 0

            guard let g = try? await Database.database().reference().child("user/\(uid)/groceryBag").getData() else {return}
            self.groceryBag = g.value as? Int ?? 0
        }
    }
}

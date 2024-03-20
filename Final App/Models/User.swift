//
//  User.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 12/20/23.
//

import SwiftUI

class User: ObservableObject{
    @Published var name: String
    @Published var age: Int
    @Published var emailAddress: String
    @Published var password: String
    @Published var subscribe: Bool
    
    init(name: String = "", age: Int = 17, emailAddress: String = "", password: String = "", subscribe: Bool = false){
        self.name = name
        self.age = age
        self.emailAddress = emailAddress
        self.password = password
        self.subscribe = subscribe
    }
    
}

//
//  Product.swift
//  StateManagement
//
//  Created by Swope, Thomas on 11/27/23.
//

import SwiftUI

struct Product: Identifiable{
    var name: String
    var price: Double
    let id = UUID()
    
    init(name: String = "Scarf", price: Double = 5){
        self.name = name
        self.price = price
    }
}

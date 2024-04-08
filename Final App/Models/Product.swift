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
    var image: String
    let id = UUID()
    
    init(name: String = "Scarf", price: Double = 5, image: String = "scarf"){
        self.name = name
        self.price = price
        self.image = image
    }
}

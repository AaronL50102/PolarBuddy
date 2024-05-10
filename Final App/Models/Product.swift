//
//  Product.swift
//  StateManagement
//
//  Created by Swope, Thomas on 11/27/23.
//

import SwiftUI

struct Product: Identifiable{
    var name: String
    var price: Int
    var image: String
    let id = UUID()
    
    init(name: String = "Scarf", price: Int = 1, image: String = "scarf"){
        self.name = name
        self.price = price
        self.image = image
    }
}

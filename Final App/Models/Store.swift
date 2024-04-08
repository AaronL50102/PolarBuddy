//
//  Store.swift
//  App
//
//  Created by Eliza Liebo (student LM) on 12/12/23.
//

import SwiftUI

class Store: ObservableObject{
    @Published var products: [Product] = [
        Product(),
        Product(name: "Scarf", price: 5, image: "scarf"),
        Product(name: "Friend", price: 25, image: ""),
        Product(name: "Hat", price: 10, image: "hat")
    ]
}

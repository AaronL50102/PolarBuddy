//
//  Store.swift
//  App
//
//  Created by Eliza Liebo (student LM) on 12/12/23.
//

import SwiftUI

class Store: ObservableObject{
    @Published var products: [Product] = [
        Product(name: "Scarf", price: 1, image: "scarf"),
        Product(name: "Hat", price: 3, image: "hat"),
        Product(name: "Glasses", price: 3, image: "glasses"),
        Product(name: "Wigs", price: 10, image: "wig1")
    ]
}

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
        Product(name: "Scarf", price: 5),
        Product(name: "Friend", price: 25),
        Product(name: "Glasses", price: 10)
    ]
}

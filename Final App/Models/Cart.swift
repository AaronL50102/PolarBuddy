//
//  Cart.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 4/18/24.
//

import SwiftUI

class Cart: ObservableObject{
    @Published var items: [Product] = []
    
    func add(item: Product){
        items.append(item)
    }
    
    
}

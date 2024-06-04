import SwiftUI



class Store: ObservableObject{
    
    @Published var products: [Product] = [
        
        Product(name: "Scarf", price: 1, image: "scarf"),
        
        Product(name: "Hat", price: 3, image: "hat"),
        
        Product(name: "Glasses", price: 5, image: "glasses"),
        
        Product(name: "Louis Bag", price: 20, image: "louisBag")
        
    ]
    
}

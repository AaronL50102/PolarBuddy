import SwiftUI







class Store: ObservableObject{

    

    @Published var products: [Product] = [

        

        Product(name: "Scarf", price: 1, image: "scarf"),

        Product(name: "Hat", price: 3, image: "hat"),

        Product(name: "Glasses", price: 5, image: "glasses"),

        Product(name: "Louis Bag", price: 20, image: "louisBag"),

        Product(name: "Iceberg", price: 30, image: "iceberg"),

        Product(name: "Flowers", price: 35, image: "flowers"),

        Product(name: "Skirt", price: 7, image: "skirt"),

        Product(name: "Watch", price: 10, image: "watch"),

        Product(name: "Necklace", price: 12, image: "necklace")



    ]

    

}

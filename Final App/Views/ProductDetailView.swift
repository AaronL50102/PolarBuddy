//
//  ProductDetailView.swift
//  StateManagement
//
//  Created by Swope, Thomas on 11/28/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

struct ProductDetailView: View{
    
    var product: Product
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var user: User
    
    var body: some View{
        VStack{
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            HStack {
                Spacer()
                Text(product.name)
                    .font(.system(size: 30))
                
                Spacer()
                Spacer()
                Text("\(String(product.price))")
                    .font(.system(size: 30))
                Image("star")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
//                    .scaleEffect(0.3)
                
                Spacer()
            }
            Spacer()
            Button {
                if product.name == "Scarf" && user.stars >= 1 {
                    user.setHasScarf(bool: true)
                    print("has scarf confirmed \(user.hasScarf)")
                    user.subtractStars(numStars: 1)
                }
                if product.name == "Hat" && user.stars >= 3 {
                    user.setHasHat(bool: true)
                    print("has hat confirmed \(user.hasHat)")
                    user.subtractStars(numStars: 3)
                }
            } label: {
                
            }
            
            Button {
                if product.name == "Scarf" && user.stars >= 1 {
                    user.setHasScarf(bool: true)
                    print("has scarf confirmed \(user.hasScarf)")
                    user.subtractStars(numStars: 1)
                    user.updateScarf()
                }
                if product.name == "Hat" && user.stars >= 3 {
                    user.setHasHat(bool: true)
                    print("has hat confirmed \(user.hasHat)")
                    user.subtractStars(numStars: 3)
                    user.updateHat()
                }
                if product.name == "Glasses" && user.stars >= 5 {
                    user.setHasGlasses(bool: true)
                    print("has glasses confirmed \(user.hasGlasses)")
                    user.subtractStars(numStars: 5)
                    user.updateGlasses()
                }
                if product.name == "Glasses" && user.stars >= 5 {
                    user.setHasGlasses(bool: true)
                    print("has glasses confirmed \(user.hasGlasses)")
                    user.subtractStars(numStars: 5)
                }
                if product.name == "Louis Bag" && user.stars >= 20 {
                    user.setHasBag(bool: true)
                    print("has glasses confirmed \(user.hasBag)")
                    user.subtractStars(numStars: 20)
                }
                if product.name == "Iceberg" && user.stars >= 30 {
                    user.setHasIceberg(bool: true)
                    print("has iceberg confirmed \(user.hasIceberg)")
                    user.subtractStars(numStars: 30)
                }
                if product.name == "Flowers" && user.stars >= 35 {
                    user.setHasFlower(bool: true)
                    print("has flowers confirmed \(user.hasFlowers)")
                    user.subtractStars(numStars: 35)
                }
                if product.name == "Skirt" && user.stars >= 7 {
                    user.setHasSkirt(bool: true)
                    print("has skirt confirmed \(user.hasSkirt)")
                    user.subtractStars(numStars: 7)
                }
                if product.name == "Watch" && user.stars >= 10 {
                    user.setHasSkirt(bool: true)
                    print("has watch confirmed \(user.hasWatch)")
                    user.subtractStars(numStars: 10)
                }
                if product.name == "Necklace" && user.stars >= 12 {
                    user.setHasNecklace(bool: true)
                    print("has necklace confirmed \(user.hasNecklace)")
                    user.subtractStars(numStars: 12)
                }
                print("button worked")
            } label: {
                Text("Buy!")
                    .font(.system(size: 30))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.black)
                    .background(Color.lightGreen)
                    .cornerRadius(20)
                //                    .offset(x: -100, y: -30)
            }
            Spacer()
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product())
            .environmentObject(Cart())
            .environmentObject(User())
    }
}

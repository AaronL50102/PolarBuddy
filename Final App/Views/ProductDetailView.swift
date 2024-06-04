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
                Spacer()
                Text(product.name)
                    .font(.custom("Helvetica Neue Thin", size: 30))
                    .padding()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack{
                    Spacer()
                    Text("\(String(product.price))")
                        .font(.custom("Helvetica Neue Thin", size: 30))
                        .padding()
                    Image("star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.3)
                        .offset(x: 50, y: 0)
                }
            }.padding(10)
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
                
            }.padding(10)
            
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
                print("button worked")
            } label: {
                Text("Buy!")
                    .font(.custom("Helvetica Neue Thin", size: 30))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.black)
                    .background(Color.lightGreen)
                    .cornerRadius(20)
                //                    .offset(x: -100, y: -30)
            }
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

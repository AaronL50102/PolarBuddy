//
//  ProductDetailView.swift
//  StateManagement
//
//  Created by Swope, Thomas on 11/28/23.
//

import SwiftUI

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
                //cart.add(item: product)
                if product.name == "Scarf" {
                    user.setHasScarf(bool: true)
                    print("has scarf confirmed \(user.hasScarf)")
                }
                if product.name == "Hat" {
                    user.setHasHat(bool: true)
                    print("has hat confirmed \(user.hasHat)")

                }
                if product.name == "Glasses" {
                    user.setHasGlasses(bool: true)
                    print("has glasses confirmed \(user.hasGlasses)")

                }
            } label: {
               Text("Buy!")
                    .font(.custom("Helvetica Neue Thin", size: 30))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundColor(Color.black)
                    .background(Color.lightGreen)
                    .cornerRadius(20)
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

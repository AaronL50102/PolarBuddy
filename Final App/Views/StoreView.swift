//
//  StoreView.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 12/12/23.
//

import SwiftUI

struct StoreView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .ignoresSafeArea()
            NavigationView {
                List(store.products) { product in
                    NavigationLink(destination: {
                        ProductDetailView(product: product)
                    }, label: {
                        HStack{
                            Image(product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                            Spacer()
                            VStack{
                                Text(product.name)
                                    .font(.custom("Helvetica Neue Thin", size: 20))
                                    .offset(x: 50, y: 0)
                                    .padding()
                                ZStack{
                                    Spacer()
                                    Text("\(String(product.price))")
                                        .font(.custom("Helvetica Neue Thin", size: 25))
                                        .offset(x: 20, y: 0)
                                        .padding()
                                    Image("star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaleEffect(0.3)
                                        .offset(x: 50, y: 0)
                                    
                                }
                                //Spacer()
                            }
                        }.padding()
                    })
                }
                .navigationTitle("Products")
            } }
    }
            }

    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView()
                .environmentObject(Store())
                .environmentObject(Cart())
        }
    }

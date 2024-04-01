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

        NavigationView {
                List(store.products) { product in
                    NavigationLink(destination: {
                        ProductDetailView(product: product)
                    }, label: {
                        HStack{
                            Spacer()
                            VStack{
                                Text(product.name)
                                Text("$\(String(format: "%.2f", product.price))")
                                //Spacer()
                            }
                        }.padding()
                    })
                }
                .navigationTitle("Products")
            } }

            }

    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView()
                .environmentObject(Store())
        }
    }

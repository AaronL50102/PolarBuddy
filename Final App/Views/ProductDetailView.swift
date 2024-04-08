//
//  ProductDetailView.swift
//  StateManagement
//
//  Created by Swope, Thomas on 11/28/23.
//

import SwiftUI

struct ProductDetailView: View{
    
    var product: Product
    
    var body: some View{
        VStack{
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            HStack {
                Text(product.name)
                    .font(.custom("Helvetica Neue Thin", size: 30))
                    .padding()
                Spacer()
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.custom("Helvetica Neue Thin", size: 30))
                    .padding()
            }.padding(10)
        }
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product())
    }
}

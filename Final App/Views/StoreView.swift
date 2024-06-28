//
//  StoreView.swift
//  StateManagement
//
//  Created by Eliza Liebo (student LM) on 12/12/23.
//



import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

struct StoreView: View {
    
    @EnvironmentObject var store: Store
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack{
            NavigationStack {
                List(store.products) { product in
                    NavigationLink(destination: {
                        ProductDetailView(product: product)
                    }, label: {
                        Spacer()
                        HStack{
                            Image(product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            //                                .frame(width: 150)
                            Spacer()
                            
                            
                            //
                            ZStack{
                                Text("\(String(product.price))")
                                    .font(.system(size: 25))
                                    .offset(x: 20, y: 0)
                                //                                        .padding()
                                Image("star")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.3)
                                    .offset(x: 50, y: 0)
                                
                            }
                        }.padding()
                    })
                }
                .navigationTitle("Products")
            }
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack{
                    Rectangle()
                        .foregroundColor(.lightBlue)
                        .cornerRadius(30)
                    HStack{
                        Spacer()
                        Image("starCart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Spacer()
                        Text("\(user.stars)")
                            .font(.system(size: 30))
                            .padding()
                        Spacer()
                    }
                    
                }
                .frame(width: 150, height: 85)
                .padding()
                
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
            .environmentObject(Store())
            .environmentObject(Cart())
            .environmentObject(User())
    }
}

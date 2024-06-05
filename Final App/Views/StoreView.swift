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

                                    .font(.custom("Helvetica Neue Thin", size: 15))

                                    .offset(x: 50, y: 0)

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

            }

            ZStack{

                Rectangle()

                    .frame(width: 120, height: 78)

                    .foregroundColor(.lightBlue)

                    .cornerRadius(27)

                    .offset(x: 100, y: -290)

                    .padding()

                Image("starCart")

                    .resizable()

                    .aspectRatio(contentMode: .fit)

                    .scaleEffect(0.17)

                    .offset(x: 115, y: -290)

                Text("\(user.stars)")

                    .font(.custom("Helvetica Neue Thin", size: 30))

                    .offset(x: 70, y: -290)

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

//
//  ReportView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct ReportView: View {
        
    @EnvironmentObject var user: User
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            
            VStack {
//                Button {
//                    guard let uid = Auth.auth().currentUser?.uid else {return}
//
//                    user.addBottle()
//                    print("\(user.waterBottle)")
//                } label: {
//                    Text("Add Water Bottle")
//                }
                
//                TextField("name", text: $user.name).onSubmit {
//                    guard let uid = Auth.auth().currentUser?.uid else {return}
//
//                    Database.database().reference().child("users/\(user.uid)/name").setValue(user.name)
//                }
                
//                Text("\(user.name)")
                
                Text("By recycling you have saved ... ")
                    .font(Constants.largeFancyFont)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.blueish)
                
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.lightBlue)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("\(Double(user.waterBottle) * 0.838)")
                                .font(Constants.largeFancyFont)
                                .foregroundColor(Color.black)
                            Text("Kilograms of Carbon Emissions")
                                .font(Constants.smallFancyFont)
                                .foregroundColor(Color.black)

//                            Database.database().reference().child("users/\(user.uid)/CO2 Emissions").setValue(Double(user.waterBottle) * 0.838 + Double(user.aluminumCan) * 0.0968 + Double(user.cardboard) * 1.814368 + Double(user.groceryBag) * 1.58)
                        }
                    }.padding()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.lightGreen)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("\(Double(user.waterBottle) * 0.05 + Double(user.aluminumCan) * 0.01 + Double(user.cardboard) * 0.02 + Double(user.groceryBag) * 0.01)")
                                .font(Constants.largeFancyFont)
                                .foregroundColor(Color.black)
                            Text("US Dollars")
                                .font(Constants.smallFancyFont)
                                .foregroundColor(Color.black)
                            
                            
                        }
                    }.padding()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.lightBlue)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("\(Double(user.waterBottle) * 8.5 + Double(user.groceryBag) * 14.67)")
                                .font(Constants.largeFancyFont)
                                .foregroundColor(Color.black)
                            Text("Grams of Plastic Waste")
                                .font(Constants.smallFancyFont)
                                .foregroundColor(Color.black)
                        }
                    }.padding()
                }
            }
//            .sheet(isPresented: $showSheet, onDismiss: {
//                guard let uid = Auth.auth().currentUser?.uid else {return}
//
//                let co2e = user.co2Emissions()
//
//                Storage.storage().reference().child("users/\(uid)").(co2e) { meta, error in
//                    if let _ = meta {
//                        Storage.storage().reference().child("users/\(uid)").downloadURL { url, error in
//                            if let u = url {
//                                Database.database().reference().child("users/\(uid)/imagepath").setValue(u.absoluteString)
//                            }
//                        }
//                    }
//                }
//            }, content: {
//
//            })
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
            .environmentObject(User())

    }
}



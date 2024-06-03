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
            ZStack{
                VStack{
                    Text("By recycling you")
                        .font(.custom("Helvetica Neue Thin", size: 40))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
                        .offset(x:-18, y:-270)
                    Text("have saved ")
                        .font(.custom("Helvetica Neue Thin", size: 40))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
                        .offset(x:-60, y:-255)
                }
                Image("kids")
                    .scaleEffect(0.20)
                    .offset(x:110, y:-210)
                Image("trash")
                    .scaleEffect(0.35)
                    .offset(x:-65, y:-185)
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.mediumDarkBlue)
                        .cornerRadius(20)
                        .frame(width: 325, height: 125, alignment: .leading)
                        .offset(x:0, y:-60)
                    VStack {
                        //                            Image("co2")
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fit)
                        Text("\(String(format: "%.3f", Double(user.waterBottle) * 0.838))")
                            .font(.custom("Helvetica Neue Thin", size: 40))
                            .bold()
                            .foregroundColor(Color.white)
                            .offset(x:0, y:-60)
                        Text("Kilograms of Carbon Emissions")
                            .font(.custom("Helvetica Neue Thin", size: 23))
                            .foregroundColor(Color.white)
                            .offset(x:0, y:-60)
                        
                        //                            Database.database().reference().child("users/\(user.uid)/CO2 Emissions").setValue(Double(user.waterBottle) * 0.838 + Double(user.aluminumCan) * 0.0968 + Double(user.cardboard) * 1.814368 + Double(user.groceryBag) * 1.58)
                    }
                }.padding()
                
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.mediumBlue)
                        .cornerRadius(20)
                        .frame(width: 325, height: 125, alignment: .leading)
                        .offset(x:0, y:95)
                    VStack {
                        //                            Image("co2")
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fit)
                        Text("\(String(format: "%.2f", Double(user.waterBottle) * 0.05 + Double(user.aluminumCan) * 0.01 + Double(user.cardboard) * 0.02 + Double(user.groceryBag) * 0.01))")
                            .font(.custom("Helvetica Neue Thin", size: 40))
                            .bold()
                            .foregroundColor(Color.white)
                            .offset(x:0, y:90)
                        
                        Text("US Dollars")
                            .font(.custom("Helvetica Neue Thin", size: 23))
                            .foregroundColor(Color.white)
                            .offset(x:0, y:95)
                    }
                }.padding()
                
                //                    Image("bottle")
                //                        .scaleEffect(0.22)
                //                        .offset(x:-116, y:23)
                //
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.lightMediumBlue)
                        .cornerRadius(20)
                        .frame(width: 325, height: 125, alignment: .leading)
                        .offset(x:0, y:255)
                    VStack {
                        //                            Image("co2")
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fit)
                        Text("\(String(format: "%.2f", Double(user.waterBottle) * 8.5 + Double(user.groceryBag) * 14.67))")
                            .font(.custom("Helvetica Neue Thin", size: 40))
                            .bold()
                            .foregroundColor(Color.white)
                            .offset(x:0, y:255)
                        
                        Text("Grams of Plastic Waste")
                            .font(.custom("Helvetica Neue Thin", size: 23))
                            .foregroundColor(Color.white)
                            .offset(x:0, y:255)
                    }
                }.padding()
                
                //                    Image("truck")
                //                        .scaleEffect(0.18)
                //                        .offset(x:120, y:170)
                ZStack{
                    VStack{
                        Text("By recycling you")
                            .font(.custom("Helvetica Neue Thin", size: 40))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .offset(x:-18, y:-270)
                        Text("have saved ")
                            .font(.custom("Helvetica Neue Thin", size: 40))
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                            .offset(x:-60, y:-255)
                    }
                    Image("kids")
                        .scaleEffect(0.20)
                        .offset(x:110, y:-210)
                    Image("trash")
                        .scaleEffect(0.35)
                        .offset(x:-65, y:-185)
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.mediumDarkBlue)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                            .offset(x:0, y:-60)
                        VStack {
                            //                            Image("co2")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fit)
                            Text(String(format: "%.2f", Double(user.waterBottle) * 0.838))
                                .font(.custom("Helvetica Neue Thin", size: 40))
                                .bold()
                                .foregroundColor(Color.white)
                                .offset(x:0, y:-60)
                            Text("Kilograms of Carbon Emissions")
                                .font(.custom("Helvetica Neue Thin", size: 23))
                                .foregroundColor(Color.white)
                                .offset(x:0, y:-60)
                            //                            Database.database().reference().child("users/\(user.uid)/CO2 Emissions").setValue(Double(user.waterBottle) * 0.838 + Double(user.aluminumCan) * 0.0968 + Double(user.cardboard) * 1.814368 + Double(user.groceryBag) * 1.58)
                        }
                    }.padding()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.mediumBlue)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                            .offset(x:0, y:95)
                        VStack {
                            //                            Image("co2")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fit)
                            Text(String(format: "%.2f", Double(user.waterBottle) * 0.05 + Double(user.aluminumCan) * 0.01 + Double(user.cardboard) * 0.02 + Double(user.groceryBag) * 0.01))
                                .font(.custom("Helvetica Neue Thin", size: 40))
                                .bold()
                                .foregroundColor(Color.white)
                                .offset(x:0, y:90)
                            Text("US Dollars")
                                .font(.custom("Helvetica Neue Thin", size: 23))
                                .foregroundColor(Color.white)
                                .offset(x:0, y:95)
                        }
                    }.padding()
                    //                    Image("bottle")
                    //                        .scaleEffect(0.22)
                    //                        .offset(x:-116, y:23)
                    //
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.lightMediumBlue)
                            .cornerRadius(20)
                            .frame(width: 325, height: 125, alignment: .leading)
                            .offset(x:0, y:255)
                        VStack {
                            //                            Image("co2")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fit)
                            Text(String(format: "%.2f", Double(user.waterBottle) * 8.5 + Double(user.groceryBag) * 14.67))
                                .font(.custom("Helvetica Neue Thin", size: 40))
                                .bold()
                                .foregroundColor(Color.white)
                                .offset(x:0, y:255)
                            
                            Text("Grams of Plastic Waste")
                                .font(.custom("Helvetica Neue Thin", size: 23))
                                .foregroundColor(Color.white)
                                .offset(x:0, y:255)
                        }
                    }.padding()
                    
                    //                    Image("truck")
                    //                        .scaleEffect(0.18)
                    //                        .offset(x:120, y:170)
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
}
    extension Double {
        func rounded(toPlaces places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
        }
    }
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            ReportView()
                .environmentObject(User())
            
        }
    }
    
    


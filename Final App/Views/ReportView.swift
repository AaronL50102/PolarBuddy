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
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            
            VStack {
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
                            Text("20")
                                .font(Constants.largeFancyFont)
                                .foregroundColor(Color.black)
                            Text("Kilograms of Carbon Emissions")
                                .font(Constants.smallFancyFont)
                                .foregroundColor(Color.black)
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
                            Text("20")
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
                            Text("20")
                                .font(Constants.largeFancyFont)
                                .foregroundColor(Color.black)
                            Text("Grams of Plastic Waste")
                                .font(Constants.smallFancyFont)
                                .foregroundColor(Color.black)
                        }
                    }.padding()
                }
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()

    }
}

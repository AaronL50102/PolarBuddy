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
                .foregroundColor(Color.blueish)
                .ignoresSafeArea()
            
            VStack {
                Text("By recycling you have saved ... ")
                    .font(Constants.largeFont)
                    .multilineTextAlignment(.center)
                
                VStack {
                    ZStack {
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                            .frame(width: 350, height: 150, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("20")
                                .font(Constants.largeFancyFont)
                            Text("Kilograms of Carbon Emissions")
                                .font(Constants.smallFancyFont)
                        }
                    }.padding()
                    
                    ZStack {
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                            .frame(width: 350, height: 150, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("20")
                                .font(Constants.largeFancyFont)
                            Text("US Dollars")
                                .font(Constants.smallFancyFont)
                        }
                    }.padding()
                    
                    ZStack {
                        Ellipse()
                            .foregroundColor(Color.lightGreen)
                            .frame(width: 350, height: 159, alignment: .leading)
                        VStack {
//                            Image("co2")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
                            Text("20")
                                .font(Constants.largeFancyFont)
                            Text("Grams of Plastic Waste")
                                .font(Constants.smallFancyFont)
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

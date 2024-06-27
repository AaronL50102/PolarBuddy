//
//  ReportView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/13/24.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase

struct ReportView: View {
    
    @EnvironmentObject var user: User
    @State var showSheet = false
    @State var appear: Double = 500
    @State var appear1: Double = 500
    @State var appear2: Double = 500
    @State var appear3: Double = 0.0
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("blueBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        VStack{
                            Image("kids")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300.0, height: 250.0)
                                .scaleEffect(x: -1, y: 1)
                            Spacer()
                            Text("By recycling you have saved:")
                                .font(.system(size: 40))
                                .bold()
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.black)
                        }
                        .opacity(appear3)
                        .onAppear{
                            withAnimation (.easeIn){
                                appear3 = 1
                            }
                        }
                        VStack{
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.mediumDarkBlue)
                                    .cornerRadius(30)
                                    .frame(width: 325, height: 125, alignment: .leading)
                                VStack {
                                    Text(String(format: "%.2f", Double(user.waterBottle) * 0.838))
                                        .font(.system(size: 40))
                                        .bold()
                                        .foregroundColor(Color.white)
                                    Text("Kilograms of Carbon Emissions")
                                        .font(.system(size: 22))
                                        .foregroundColor(Color.white)
                                }
                            }
                            .offset(x: appear)
                            .onAppear{
                                withAnimation (.spring(dampingFraction: 0.6).delay(0.5)){
                                    appear = 0
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.mediumBlue)
                                    .cornerRadius(30)
                                    .frame(width: 325, height: 125, alignment: .leading)
                                //.offset(x:0, y:95)
                                VStack {
                                    Text("$\(String(format: "%.2f", Double(user.waterBottle) * 0.05 + Double(user.aluminumCan) * 0.01 + Double(user.cardboard) * 0.02 + Double(user.groceryBag) * 0.01))")
                                        .font(.system(size: 40))
                                        .bold()
                                        .foregroundColor(Color.white)
                                    Text("US Dollars")
                                        .font(.system(size: 23))
                                        .foregroundColor(Color.white)
                                }
                            }
                            //                            .padding()
                            .offset(x: appear1)
                            .onAppear{
                                withAnimation (.spring(dampingFraction: 0.6).delay(0.6)){
                                    appear1 = 0
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.lightMediumBlue)
                                    .cornerRadius(30)
                                    .frame(width: 325, height: 125, alignment: .leading)
                                //.offset(x:0, y:255)
                                VStack {
                                    Text(String(format: "%.2f", Double(user.waterBottle) * 8.5 + Double(user.groceryBag) * 14.67))
                                        .font(.system(size: 40))
                                        .bold()
                                        .foregroundColor(Color.white)
                                    //.offset(x:0, y:255)
                                    Text("Grams of Plastic Waste")
                                        .font(.system(size: 23))
                                        .foregroundColor(Color.white)
                                    //.offset(x:0, y:255)
                                }
                            }
                            //                            .padding()
                            .offset(x: appear2)
                            .onAppear{
                                withAnimation (.spring(dampingFraction: 0.6).delay(0.7)){
                                    appear2 = 0
                                }
                            }
                            
                            
                            
                        }
                        
                        
                        Text("More Info")
                            .font(.custom("Helvetica Neue Thin", size: 45))
                            .bold()
                            .foregroundColor(Color.black)
                        VStack{
                            NavigationLink {
                                FactsView()
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.mediumBlue)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("emission")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        Text("Carbon Dioxide Levels")
                                            .foregroundColor(.white)
                                            .font(.system(size: 27))
                                            .padding(.horizontal, 30)
                                    }
                                }
                                .frame(width: 370, height: 120)
                                
                            }
                            NavigationLink {
                                RecycleView()
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.mediumBlue)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("recycle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        
                                        Text("Learn About Recycling")
                                            .foregroundColor(.white)
                                            .font(.system(size: 27))
                                            .padding(.horizontal, 50)
                                    }
                                }
                                .frame(width: 370, height: 120)
                                
                            }
                        }
                    }
                }
            }
        }
//        .ignoresSafeArea()
        
        
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
            .environmentObject(FactsModel())
    }
}


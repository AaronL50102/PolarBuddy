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
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("blueBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(1.5)
                    .opacity(0.2)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ZStack {
                            //                    Rectangle()
                            //                        .foregroundColor(Color.white)
                            //                        .ignoresSafeArea()
                            ZStack{
                                VStack{
                                    VStack{
                                        Text("By recycling you")
                                            .font(.custom("Helvetica Neue Thin", size: 40))
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.black)
            //                                .offset(x:-18, y:-270)
                                        HStack{
                                            Text("have saved ")
                                                .font(.custom("Helvetica Neue Thin", size: 40))
                                                .bold()
                                                .multilineTextAlignment(.leading)
                                                .foregroundColor(Color.black)
                //                                .offset(x:-60, y:-255)
                                            Spacer()
                                        }.padding(.leading, 80)
                                        Spacer()
                                    }
                                    .padding(.top, 20)
                                    VStack{
                                        Image("kids")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150)
                //                            .scaleEffect(0.20)
                //                            .offset(x:110, y:-210)
                                        Spacer()
                                    }
                                    .padding(.top, -50)
                                    .padding(.leading, 210)
                                    VStack{
                                        Image("trash")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 250)
                //                            .scaleEffect(0.35)
                //                            .offset(x:-65, y:-185)
                                        Spacer()
                                    }
                                    .padding(.top, -190)
                                    .padding(.trailing, 160)
                                    VStack{
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color.mediumDarkBlue)
                                                .cornerRadius(20)
                                                .frame(width: 325, height: 125, alignment: .leading)
                                                //.offset(x:0, y:-60)
                                            VStack {
                                                Text(String(format: "%.2f", Double(user.waterBottle) * 0.838))
                                                    .font(.custom("Helvetica Neue Thin", size: 40))
                                                    .bold()
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:-60)
                                                Text("Kilograms of Carbon Emissions")
                                                    .font(.custom("Helvetica Neue Thin", size: 23))
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:-60)
                                            }
                                        }.padding()
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color.mediumBlue)
                                                .cornerRadius(20)
                                                .frame(width: 325, height: 125, alignment: .leading)
                                                //.offset(x:0, y:95)
                                            VStack {
                                                Text(String(format: "%.2f", Double(user.waterBottle) * 0.05 + Double(user.aluminumCan) * 0.01 + Double(user.cardboard) * 0.02 + Double(user.groceryBag) * 0.01))
                                                    .font(.custom("Helvetica Neue Thin", size: 40))
                                                    .bold()
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:90)
                                                Text("US Dollars")
                                                    .font(.custom("Helvetica Neue Thin", size: 23))
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:95)
                                            }
                                        }.padding()
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color.lightMediumBlue)
                                                .cornerRadius(20)
                                                .frame(width: 325, height: 125, alignment: .leading)
                                                //.offset(x:0, y:255)
                                            VStack {
                                                Text(String(format: "%.2f", Double(user.waterBottle) * 8.5 + Double(user.groceryBag) * 14.67))
                                                    .font(.custom("Helvetica Neue Thin", size: 40))
                                                    .bold()
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:255)
                                                Text("Grams of Plastic Waste")
                                                    .font(.custom("Helvetica Neue Thin", size: 23))
                                                    .foregroundColor(Color.white)
                                                    //.offset(x:0, y:255)
                                            }
                                        }.padding()
                                    }
                                    .padding(.top, -100)
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
                                        .foregroundColor(Color.white)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("emission")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        VStack{
                                            Text("Carbon Dioxide")
                                            Text("Levels")
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)
                                        .font(.custom("Helvetica Neue Thin", size: 30))
                                        .padding(.horizontal, 30)
                                    }
                                }
                                //.frame(width: 300, height: 300)
                            }
                            NavigationLink {
                                RecycleView()
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("recycle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        VStack{
                                            Text("Learn About")
                                            Text("Recycle")
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)
                                        .font(.custom("Helvetica Neue Thin", size: 30))
                                        .padding(.horizontal, 50)
                                    }
                                }
                                //.frame(width: 300, height: 300)
                            }
                            NavigationLink {
                                RecycleView()//CHANGE THIS TO A NEW VIEW
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("recycle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        VStack{
                                            Text("Environmental")
                                            Text("Impacts")
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)
                                        .font(.custom("Helvetica Neue Thin", size: 30))
                                        .padding(.horizontal, 38)
                                    }
                                }
                            }
                            Text("Boost Your Impact")
                                .font(.custom("Helvetica Neue Thin", size: 35))
                                .bold()
                                .foregroundColor(Color.black)
                            Text("Check out what others are doing!")
                                .font(.custom("HelveticaNeue-Thin", size: 20))
                            NavigationLink {
                                RecycleView()//CHANGE THIS TO A NEW VIEW
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                        .cornerRadius(30)
                                        .frame(width: 370, height: 120)
                                    HStack{
                                        Image("recycle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(30)
                                            .frame(width: 120)
                                        VStack{
                                            Text("Environmental")
                                            Text("Impacts")
                                        }
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.black)
                                        .font(.custom("Helvetica Neue Thin", size: 30))
                                        .padding(.horizontal, 38)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(width: 500)
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
            .environmentObject(FactsModel())
    }
}
    

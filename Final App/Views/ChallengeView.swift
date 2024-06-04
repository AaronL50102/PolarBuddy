//
//  ChallengeView.swift
//  Final App
//
//  Created by Aaron Lin (student LM) on 6/4/24.
//

import SwiftUI

struct ChallengeView: View {
    @EnvironmentObject  var user: User
    
    var body: some View {
        ZStack{
            Image("blueBackground2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .scaleEffect(1.3)
                .opacity(0.4)
            VStack{
                HStack{
                    Text("Challenges")
                        .font(.custom("Helvetica Neue Thin", size: 40))
                        .bold()
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                        .padding(.top, -10)
                }
                .padding(.top, 30)
                Spacer()
                Spacer()
                ScrollView (.vertical, showsIndicators: false){
                    VStack{
                        ZStack{
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .frame(width: 350, height: 150)
                                .cornerRadius(25)
                                .foregroundColor(Color.lightBlue)
                            HStack{
                                VStack{
                                    Text("Recycle Water Bottles")
                                        .font(.custom("Helvetica Neue Thin", size: 23))
                                        .bold()
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 15)
                                    HStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 150, height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color.gray)
                                                .padding(.vertical, 15)
                                                .padding(.leading, -60)
                                            Rectangle()
                                                .frame(width: (CGFloat(150 * (user.waterBottle % 10)) / 10), height: 20, alignment: .leading)
                                                .cornerRadius(20)
                                                .foregroundColor(Color(hue: 0.152, saturation: 0.96, brightness: 0.884))
                                                .padding(.vertical, 15)
                                                .padding(.leading, -60)
                                        }
                                        Text("\(user.waterBottle % 10)/10")
                                            .font(.custom("Helvetica Neue Thin", size: 20))
                                    }
                                }
                                Image("waterBottle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45)
                                    .rotationEffect(.degrees(15))
                            }
                        }
                        ZStack{
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .frame(width: 350, height: 150)
                                .cornerRadius(25)
                                .foregroundColor(Color.lightBlue)
                            HStack{
                                VStack{
                                    VStack{
                                        Text("Recycle")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                            .padding(.horizontal, -10)
                                            .padding(.vertical, 10)
                                        Text("Aluminum Cans")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                            .padding(.horizontal, -10)
                                            .padding(.vertical, -15)
                                    }
                                    .padding(.leading, 30)
                                    .padding(.vertical, 7)
                                    HStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 150, height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color.gray)
                                                .padding(.vertical, 20)
                                                .padding(.leading, 40)
                                            Rectangle()
                                                .frame(width: (CGFloat(150 * (user.aluminumCan % 10)) / 10), height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color(hue: 0.152, saturation: 0.96, brightness: 0.884))
                                                .padding(.vertical, 20)
                                                .padding(.leading, 40)
                                        }
                                        Text("\(user.aluminumCan % 10)/10")
                                            .font(.custom("Helvetica Neue Thin", size: 20))
                                    }
                                }
                                Image("aluminumCan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 125)
                                    .rotationEffect(.degrees(-15))
                                    .padding(.trailing, 20)
                            }
                        }
                        ZStack{
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .frame(width: 350, height: 150)
                                .cornerRadius(25)
                                .foregroundColor(Color.lightBlue)
                            HStack{
                                VStack{
                                    VStack{
                                        Text("Recycle Cardboard")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                    }
                                    .padding(.leading, 30)
                                    .padding(.vertical, 7)
                                    HStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 150, height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color.gray)
                                                .padding(.vertical, 20)
                                                .padding(.leading, 10)
                                            Rectangle()
                                                .frame(width: (CGFloat(150 * (user.cardboard % 10)) / 10), height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color(hue: 0.152, saturation: 0.96, brightness: 0.884))
                                                .padding(.vertical, 20)
                                                .padding(.leading, 10)
                                        }
                                        
                                        Text("\(user.cardboard % 10)/10")
                                            .font(.custom("Helvetica Neue Thin", size: 20))
                                    }
                                }
                                Image("cardboard")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 110)
                                    .rotationEffect(.degrees(15))
                            }
                        }
                        ZStack{
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .frame(width: 350, height: 150)
                                .cornerRadius(25)
                                .foregroundColor(Color.lightBlue)
                            HStack{
                                VStack{
                                    VStack{
                                        Text("Recycle")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                            .padding(.horizontal, -10)
                                            .padding(.vertical, 10)
                                        Text("Plastic Bags")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                            .padding(.horizontal, -10)
                                            .padding(.vertical, -15)
                                    }
                                    .padding(.leading, 30)
                                    .padding(.vertical, 7)
                                    HStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 150, height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color.gray)
                                                .padding(.vertical, 20)
                                                .padding(.leading, 35)
                                            Rectangle()
                                                .frame(width: (CGFloat(150 * (user.groceryBag % 10)) / 10), height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color(hue: 0.152, saturation: 0.96, brightness: 0.884))
                                                .padding(.vertical, 20)
                                                .padding(.leading, 35)
                                        }
                                        Text("\(user.groceryBag % 10)/10")
                                            .font(.custom("Helvetica Neue Thin", size: 20))
                                    }
                                }
                                Image("plasticbag")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75)
                                    .rotationEffect(.degrees(-15))
                                    .padding(.trailing, 20)
                            }
                            .padding(.trailing, 40)
                        }
                        ZStack{
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.black, lineWidth: 2)
                                )
                                .frame(width: 350, height: 150)
                                .cornerRadius(25)
                                .foregroundColor(Color(hue: 0.202, saturation: 0.973, brightness: 0.999))
                            HStack{
                                VStack{
                                    VStack{
                                        Text("Recycle Any Item")
                                            .font(.custom("Helvetica Neue Thin", size: 23))
                                            .bold()
                                    }
                                    .padding(.leading, 10)
                                    .padding(.vertical, 7)
                                    HStack{
                                        ZStack(alignment: .leading){
                                            Rectangle()
                                                .frame(width: 150, height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color.gray)
                                                .padding(.vertical, 20)
                                                .padding(.leading, 10)
                                            Rectangle()
                                                .frame(width: (CGFloat(150 * (user.totalRecycled() % 50)) / 50), height: 20)
                                                .cornerRadius(20)
                                                .foregroundColor(Color(hue: 0.152, saturation: 0.96, brightness: 0.884))
                                                .padding(.vertical, 20)
                                                .padding(.leading, 10)
                                        }
                                        
                                        Text("\(user.totalRecycled() % 50)/50")
                                            .font(.custom("Helvetica Neue Thin", size: 20))
                                    }
                                }
                                Image("recycle 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .rotationEffect(.degrees(15))
                            }
                        }

                    }
                }
                .frame(width: 1000)
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
            .environmentObject(User())
    }
}


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
                    Spacer()
                }
                .padding(.leading, 40)
                .padding(.top, 30)
                Spacer()
                Spacer()
                ScrollView {
                    VStack{
                        ZStack{
                            Rectangle()
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
                                        Rectangle()
                                            .frame(width: 170, height: 20)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.gray)
                                            .padding(.vertical, 15)
                                            .padding(.leading, -40)
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
                                        Rectangle()
                                            .frame(width: 170, height: 20)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.gray)
                                            .padding(.vertical, 20)
                                            .padding(.leading, 55)
                                        Text("\(user.waterBottle % 10)/10")
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
                                        Rectangle()
                                            .frame(width: 170, height: 20)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.gray)
                                            .padding(.vertical, 20)
                                            .padding(.leading, 25)
                                        Text("\(user.waterBottle % 10)/10")
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
                                        Rectangle()
                                            .frame(width: 170, height: 20)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.gray)
                                            .padding(.vertical, 20)
                                            .padding(.leading, 55)
                                        Text("\(user.waterBottle % 10)/10")
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

                    }
                }
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

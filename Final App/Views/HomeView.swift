//

//  HomeView.swift

//  Final App

//

//  Created by Eliza Liebo (student LM) on 3/13/24.

//



import SwiftUI

import Firebase

import FirebaseCore

import FirebaseAuth

import FirebaseDatabase



struct HomeView: View {



    @EnvironmentObject var user: User

    @EnvironmentObject var cart: Cart

    @State var daysOld: Int = 0

 //   @State var points: Int = 60 // Initial value for points

    let maxPoints: Int = 100 // Maximum value for points



    var body: some View {



        ZStack{

            NavigationView{

                VStack{

                    Spacer()

                    HStack{

                        Spacer()

                        

                        NavigationLink {

                            StoreView()

                        } label: {

                            HStack{

                                Text("Store")

                                Image(systemName: "cart")

                            }

                            .foregroundColor(.black)

                            .padding()

                            .background(Color.lightBlue)

                            .cornerRadius(20)

                            Spacer()

                        }.padding(.leading, 20)

                        

                        Spacer()

                        Spacer()

                        Spacer()

                        Spacer()

                        

                        NavigationLink {

                            InstructionsView()

                        } label: {

                            HStack{

                                Image(systemName: "questionmark.circle.fill")

                                    .resizable()

                                    .scaledToFit()

                                    .scaleEffect(0.3)

                                    .foregroundColor(.lightBlue)

                                    .padding()

                            }

//                            .foregroundColor(.black)

//                            .padding()

//                            .background(Color.lightBlue)

//                            .cornerRadius(20)

//                            .padding()

                        }

                    }



                    Spacer()

                    Spacer()

                    

                    HStack{

                        

                        Spacer()

                        Spacer()

                        Spacer()

                        Spacer()

                        Spacer()

                        Spacer()

                        

                        ZStack{

                            if user.hasIceberg {

//                                VStack{

//                                    Spacer()

                                    Image("iceberg")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(1.3)

                                        .offset(x: 8, y: 120)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            if user.hasFlowers {

//                                VStack{

//                                    Spacer()

                                    Image("flowers")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(1.2)

                                        .offset(x: 8, y: 40)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            Image("polar")

                                .resizable()

                                .aspectRatio(contentMode: .fit)

                                .scaleEffect(2)

                            if user.hasHat {

//                                VStack{

                                    Image("hat")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.42)

                                        .offset(x: 5, y: -137)

//                                    Spacer()

//                                }

//                                .padding(.top, 35)

//                                .padding(.leading, 10)

                            }

                            if user.hasScarf {

//                                VStack{

                                    Image("scarf")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.65)

                                        .offset(x: 5, y: -50)

//                                    Spacer()

//                                }

//                                .padding(.top, 155)

//                                .padding(.leading, 10)

                            }

                            if user.hasGlasses {

//                                VStack{

                                    Image("glasses")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.34)

                                        .offset(x: 5, y: -110)

//                                    Spacer()

//                                }

//                                .padding(.top, 69)

//                                .padding(.leading, 9)

                            }

                            if user.hasBag {

//                                VStack{

//                                    Spacer()

                                    Image("louisBag")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.56)

                                        .offset(x: 8, y: 30)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            if user.hasSkirt {

//                                VStack{

//                                    Spacer()

                                    Image("skirt")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(1)

                                        .offset(x: 0, y: 60)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            if user.hasWatch {

//                                VStack{

//                                    Spacer()

                                    Image("watch")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.3)

                                        .offset(x: 30, y: -5)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            if user.hasNecklace {

//                                VStack{

//                                    Spacer()

                                    Image("necklace")

                                        .resizable()

                                        .aspectRatio(contentMode: .fit)

                                        .scaleEffect(0.6)

                                        .offset(x: 2, y: -30)

//                                }

//                                .padding(.bottom, 210)

//                                .padding(.leading, 50)

                            }

                            

                        }

                        ZStack(alignment: .bottom) {

                            Rectangle()

                                .frame(width: 35, height: 320)

                                .foregroundColor(.lightBlue)

                                .cornerRadius(50)

                            Rectangle()

                                .frame(width: 35, height: CGFloat(320 * (CGFloat(user.points) / CGFloat(maxPoints))))

                                .foregroundColor(.lightMediumBlue)

                                .cornerRadius(50)

                            Image("star")

                                .resizable()

                                .aspectRatio(contentMode: .fit)

                                .scaleEffect(0.4)

                                .offset(x: 0, y: -280)

                        }

                        .frame(height: 320)

                        .padding()

                    }

                    Spacer()

                    TextField("Name", text: $user.name)

                        .padding()

                        .font(Constants.largeFont)

                        .multilineTextAlignment(.center)

                        .foregroundColor(.blueish)

                    Spacer()

                    Spacer()

                }

            }

        }

    }

}



struct HomeView_Previews: PreviewProvider {

    static var previews: some View {

        HomeView()

            .environmentObject(Store())

            .environmentObject(User())

            .environmentObject(Cart())

    }

}

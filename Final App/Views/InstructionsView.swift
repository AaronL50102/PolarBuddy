//
//  InstructionsView.swift
//  Final App
//
//  Created by Matthew Hartstein (student LM) on 6/4/24.
//

import SwiftUI

struct InstructionsView: View {
    
    @EnvironmentObject var user: User
    @State var scale1: Double = 0
    @State var scale2: Double = 0
    @State var scale3: Double = 0
    @State var scale4: Double = 0


    var body: some View {
        ZStack {
            Image("differentBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                
                .opacity(0.4)
            ScrollView (.vertical, showsIndicators: false){
                Text("FAQs")
                    .font(.custom("Helvetica Neue Thin", size: 40))
                    .bold()
                    .foregroundColor(Color.black)
                ZStack{
                    Rectangle()
                        .frame(width: 325,height: 415)
                        .foregroundColor(Color.lightMediumBlue)
                        .cornerRadius(20)
                    VStack{
                        Image("bag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 125)
                        Text("How do I tell the app that I have recycled?")
                            .font(.custom("Helvetica Neue Thin", size: 30))
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 350,height: 100)
                        Text("Go to the 'Input' tab on the main menu and click on the camera. Use your phone camera to take a picture of your item then make sure it was identified properly. The item will be automatically added once you hit 'correct'!")
                            .font(.custom("Helvetica Neue Thin", size: 16))
                            .frame(width: 300,height: 100)
                            .foregroundColor(Color.white)
                    }
                }
                .scaleEffect(scale1)
                .onAppear{
                    withAnimation (.spring(dampingFraction: 1)){
                        scale1 = 1
                    }
                }
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width: 325,height: 415)
                        .foregroundColor(Color.mediumBlue)
                        .cornerRadius(20)
                    VStack{
                        Image("recycleBear")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 145)
                        
                        Text("How does the point system work?")
                            .font(.custom("Helvetica Neue Thin", size: 30))
                            .bold()
                            .frame(width: 350,height: 100)
                            .foregroundColor(Color.white)
                            
                        Text("Once your item is correctly identified, based on a number of factors, including its carbon footprint and plastic waste, we determine how many points your item is worth. For example, a standard 16.9 oz plastic water bottle is worth 10 points.")
                            .font(.custom("Helvetica Neue Thin", size: 14))
                            .frame(width: 300,height: 100)
                            .foregroundColor(Color.white)
                    }
                }
                .scaleEffect(scale2)
                .onAppear{
                    withAnimation (.spring(dampingFraction: 1).delay(0.15)){
                        scale2 = 1
                    }
                }
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width: 325,height: 415)
                        .foregroundColor(Color.mediumDarkBlue)
                        .cornerRadius(20)
                    VStack{
                        Image("trophy")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 145)
                        
                        Text("How do my points convert to stars?")
                            .font(.custom("Helvetica Neue Thin", size: 30))
                            .bold()
                            .frame(width: 350,height: 100)
                            .foregroundColor(Color.white)
                            
                        Text("Every 100 points you recieve a star. The sliding bar next to your polar bear shows you how close you are to getting your next star. Stars are automatically claimed once you reach 100 points, and your point total will go down by 100 accordingly.")
                            .font(.custom("Helvetica Neue Thin", size: 14))
                            .frame(width: 300,height: 100)
                            .foregroundColor(Color.white)
                    }
                }
                .scaleEffect(scale3)
                .onAppear{
                    withAnimation (.spring(dampingFraction: 1).delay(0.3)){
                        scale3 = 1
                    }
                }
                ZStack{
                    Rectangle()
                        .frame(width: 325,height: 415)
                        .foregroundColor(Color.ExtradarkBlue)
                        .cornerRadius(20)
                    VStack{
                        Image("aluminumCan")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 125)
                        Text("How do challenges work?")
                            .font(.custom("Helvetica Neue Thin", size: 30))
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 350,height: 100)
                        Text("You can check your active challenges and your progress in the 'Challenges' tab. All challenges are repeatable and automatically tracked!")
                            .font(.custom("Helvetica Neue Thin", size: 19))
                            .frame(width: 300,height: 100)
                            .foregroundColor(Color.white)
                    }
                }
                .scaleEffect(scale4)
                .onAppear{
                    withAnimation (.spring(dampingFraction: 1).delay(0.45)){
                        scale4 = 1
                    }
                }
                .frame(width: 500)
            }
        }
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
    }
}




struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
            .environmentObject(User())
    }
}

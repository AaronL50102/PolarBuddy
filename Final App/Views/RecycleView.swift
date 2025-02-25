//
//  RecycleView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/19/24.
//

import SwiftUI

struct RecycleView: View {
    
    @State var scale1: Double = 0
    @State var scale2: Double = 0
    @State var scale3: Double = 0

    var body: some View {
        
        ScrollView{
            Text("How to Recycle")
                .font(.system(size: 40))
                .bold()
                .foregroundColor(Color.black)
            Spacer()
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
                    Text("RULE 1: Know what to throw")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 350,height: 100)
                    Text("Only put recyclable materials – paper, cardboard, metal cans, plastic bottles and jugs – in your recycling cart.")
                        .font(.system(size: 20))
                        .frame(width: 300,height: 100)
                        .foregroundColor(Color.white)
                }
            }
            .scaleEffect(scale1)
            .onAppear{
                withAnimation (.spring(dampingFraction: 1).delay(0.0)){
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
                    
                    Text("RULE 2: Empty. Clean. Dry.")
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 350,height: 100)
                        .foregroundColor(Color.white)
                        
                    Text("Make sure all recyclables have been emptied, rinsed and patted dry. Dirty items will interfere with the recycling process.")
                        .font(.system(size: 20))
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
                    .frame(width: 325,height: 400)
                    .foregroundColor(Color.mediumDarkBlue)
                    .cornerRadius(20)
                VStack{
                    Image("noBag")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 125)
                    Text("RULE 3: Don't Bag It")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(Color.white)
                    Text("Your recyclable items should be placed loose in the cart. No need to bag them.")
                        .font(.system(size: 20))
                        .frame(width: 300,height: 100)
                        .foregroundColor(Color.white)
                }
            }
            .scaleEffect(scale3)
            .onAppear{
                withAnimation (.spring(dampingFraction: 1).delay(0.30)){
                    scale3 = 1
                }
            }
        }
    }
}

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
            .environmentObject(Store())
            .environmentObject(User())
            .environmentObject(FactsModel())
        
    }
}

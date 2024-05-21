//
//  RecycleView.swift
//  Final App
//
//  Created by Jordan Levinson (student LM) on 3/19/24.
//

import SwiftUI

struct RecycleView: View {
    
    @State private var offset = CGSize.zero
    var body: some View {
        
        ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                
                Text("How to Recycle")
                    .font(Constants.mediumFancyFont)
                    .foregroundColor(Color.black)
                    .frame(width: 325,height: 625)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                
                    .rotationEffect(.degrees(offset.width / 5.0))
                    .offset(x: offset.width * 5)
                    .opacity(2 - Double(abs(offset.width / 50)))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                if abs(offset.width) > 100 {
                                    // remove the card
                                } else {
                                    offset = .zero
                                }
                            }
                    )
            }
            
            
            
            
            
            //                Text("RULE 1: Recycle bottles, cans, paper, and cardboard")
            //                    .font(Constants.smallFancyFont)
            //                    .frame(width: 325,height: 125)
            //                    .background(Color.lightBlue)
            //                    .cornerRadius(20)
            //                    .rotationEffect(.degrees(offset.width / 5.0))
            //                    .offset(x: offset.width * 5)
            //                    .opacity(2 - Double(abs(offset.width / 50)))
            //                    .gesture(
            //                        DragGesture()
            //                            .onChanged { gesture in
            //                                offset = gesture.translation
            //                            }
            //                            .onEnded { _ in
            //                                if abs(offset.width) > 100 {
            //                                    // remove the card
            //                                } else {
            //                                    offset = .zero
            //                                }
            //                            }
            //                    )
            //            }
            
            //
            //                Spacer()
            //
            //                Text("RULE 1: Recycle bottles, cans, paper, and cardboard")
            //                        .font(Constants.smallFancyFont)
            //                        .frame(width: 325,height: 125)
            //                        .background(Color.lightBlue)
            //                        .cornerRadius(20)
            //
            //
            //                Spacer()
            //
            //                Text("RULE 2: Keep food and liquid out of your recycling")
            //                        .font(Constants.smallFancyFont)
            //                        .frame(width: 325,height: 125)
            //                        .background(Color.lightGreen)
            //                        .cornerRadius(20)
            //
            //
            //
            //                Spacer()
            //
            //
            //                Text("RULE 3: No loose plastic bags and no bagged recyclables")
            //                    .font(Constants.smallFancyFont)
            //                    .frame(width: 325,height: 125)
            //                    .background(Color.lightBlue)
            //                    .cornerRadius(20)
            //
            //
            //                Spacer()
            //
            //
            //                Text("RULE 4: Look for bins with this symbol")
            //                    .font(Constants.smallFancyFont)
            //                    .frame(width: 325,height: 125)
            //                    .background(Color.lightGreen)
            //                    .cornerRadius(20)
            //
            //
            
            
        }
    }


struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleView()
    }
}

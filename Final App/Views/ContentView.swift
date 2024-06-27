//
//  ContentView.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/8/24.
//

import SwiftUI

enum ViewState {
    case home, info, report, input
}

struct ContentView: View {
    
    @State var viewState: ViewState = .home
    @State var test: Int = 1 //Remove later
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ChallengeView()
                .tabItem {
                    Label("Tasks", systemImage: "book")
                }
            InputView()
                .tabItem {
                          Spacer(minLength: 20)
                          Image(uiImage: resizeImage(UIImage(systemName: "paintbrush.fill")!, targetSize: CGSize(width: 20, height: 27))!)
                          Text("Appearance")
                        }
            ReportView()
                .tabItem {
                    Label("Info", systemImage: "pencil")
                }
            
            
        }
        
        .onAppear(perform: {
            UITabBar.appearance().backgroundColor = .white
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            } else {
                // Fallback on earlier versions
            }
            
        })
       
    }
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        // Calculate the scaling factor to fit the image to the target dimensions while maintaining the aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let ratio = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let yOffset = (targetSize.height - newSize.height) // Leave the top blank and align the bottom
        
        //Create a new image context
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { context in
          // Fill the background with a transparent color
          context.cgContext.setFillColor(UIColor.clear.cgColor)
          context.cgContext.fill(CGRect(origin: .zero, size: targetSize))
          
          // draw new image
          image.draw(in: CGRect(x: 0, y: yOffset, width: newSize.width, height: newSize.height))
        }
        
        return newImage
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store())
            .environmentObject(User())
            .environmentObject(FactsModel())
    }
}


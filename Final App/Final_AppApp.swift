//
//  Final_AppApp.swift
//  Final App
//
//  Created by Eliza Liebo (student LM) on 3/8/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Final_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    @StateObject var home: Home = Home()
//    @StateObject var info: Info = Info()
//    @StateObject var input: Input = Input()
//    @StateObject var report: Report = Report()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(home)
//                .environmentObject(info)
//                .environmentObject(report)
//                .environmentObject(input)
        }
    }
}

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
    @StateObject var cart = Cart()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var user: User = User()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(user)
                .environmentObject(cart)
        }
    }
}

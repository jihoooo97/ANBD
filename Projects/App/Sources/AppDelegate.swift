//
//  AppDelegate.swift
//  ANBD
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
//        let secondaryOptions = FirebaseOptions(
//            googleAppID: "1:1059046414714:ios:9856770633e4a28fa7dec3",
//            gcmSenderID: "1059046414714"
//        )
//        
//        secondaryOptions.apiKey = "AIzaSyDnl-46vzGqqXw8CMZhi2LWClinfimQTO4"
//        secondaryOptions.projectID = "anbd-project3"
//        secondaryOptions.bundleID = "com.jiho.ANBD"
//        secondaryOptions.clientID = "1059046414714-rj1vpip9i5641dnp55slddsrpee2ab6m.apps.googleusercontent.com"
//        secondaryOptions.storageBucket = "anbd-project3.appspot.com"
//        secondaryOptions.appGroupID = nil
//        
//        FirebaseApp.configure(options: secondaryOptions)
        FirebaseApp.configure()
        return true
    }
    
}

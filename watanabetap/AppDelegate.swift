//
//  AppDelegate.swift
//  watanabetap
//
//  Created by 丸井優希 on 2022/12/24.
//

import UIKit
import GoogleMobileAds
import NCMB

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let applicationkey  = "230c0d4de3398f8006a87dc94bc6b96722159f2129c87fae82bcdb05f16f5420"
    let clientkey       = "c2b7dbc0759fc773ed4c7c25b45779933d1ddd309e82dea242823ed057927213"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        NCMB.initialize(applicationKey: applicationkey, clientKey: clientkey)
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


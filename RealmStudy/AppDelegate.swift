//
//  AppDelegate.swift
//  RealmStudy
//
//  Created by 深瀬 貴将 on 2019/12/09.
//  Copyright © 2019 深瀬 貴将. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
<<<<<<< HEAD
        //Override point for customization after application launch.
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldScheamVersion in
                if (oldScheamVersion < 3) {

                }
=======
        // Override point for customization after application launch.
        let config = Realm.Configuration(
            schemaVersion: 3,
            migrationBlock: { migration, oldScheamVersion in
               if (oldScheamVersion < 3) {

               }
>>>>>>> 02e0543ed02a62ee28884872013bef58d05c6707
        })

        Realm.Configuration.defaultConfiguration = config
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


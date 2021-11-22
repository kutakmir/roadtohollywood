//
//  AppDelegate.swift
//  Road to Hollywood
//
//  Created by Miroslav Kutak on 19/11/21.
//

import Foundation
import GoogleSignIn
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        // Initialize Google sign-in.
//        GIDSignIn.sharedInstance().clientID = "275300151551-sis0nn7um9t8bkfus9p6iipp3330ecm2.apps.googleusercontent.com"
    }

    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
//        return GIDSignIn.sharedInstance.handle(url,
//                                                 sourceApplication: sourceApplication,
//                                                 annotation: annotation)
    }

    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }

}

 //
//  AppDelegate.swift
//  TinMessenger
//
//  Created by Иван on 20.09.17.
//  Copyright © 2017 Иван. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        print("start of the app, configuring options : didFinishLaunchingWithOptions \n")
//Артем! Привет! Сделал так, видимо это стопроцентно неправильно, но я хз как по другому, честно. Принты то вывести особо много ума не надо, но я сделал это видимо не так =)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Application moved from applicationDidBecomeActive to applicationWillResignActive state: applicationWillResignActive \n")
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Application moved from applicationWillResignActive to applicationDidEnterBackground state: applicationDidEnterBackground \n")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Application moved from applicationDidEnterBackground to applicationWillEnterForeground state: applicationWillEnterForeground \n")
    
        
        // Called as part of the tra=nsition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application moved from didFinishLaunchingWithOptions to applicationDidBecomeActive state: applicationDidBecomeActive \n")
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(" Application moved from applicationDidEnterBackground to applicationWillTerminate state: applicationWillTerminate \n")
        
//       НАДО ФЛАЖОК ПОМЕНЯТЬ В ИНФО ПЛИСТЕ
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


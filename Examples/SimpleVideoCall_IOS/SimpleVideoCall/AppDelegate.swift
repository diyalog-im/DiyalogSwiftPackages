//
//  AppDelegate.swift
//  DiyalogCarthageDeneme
//
//  Created by Tolga Cakiroglu on 23.12.2021.
//

import UIKit
import DiyalogEngine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override init(){
        super.init();
        
        DiyalogEngine.diyalogInstance().endpoints = ["wss://<YOUR_DIYALOG_SERVER>"]

        //Diyalog Test App
        DiyalogEngine.diyalogInstance().apiId = <YOUR_APP_API_ID>
        DiyalogEngine.diyalogInstance().apiKey = "<YOUR_APP_API_KEY>"
        DiyalogEngine.diyalogInstance().trustedKeys = [
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_1>",
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_2>",
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_3>",
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_4>",
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_5>",
            "<YOUR_DIYALOG_ENVIRONMENT_PUBLIC_KEY_6>"
        ]
        
        
        DiyalogEngine.diyalogInstance().setappName("<YOUR_APP_NAME")
        DiyalogEngine.diyalogInstance().setLocalizationLanguage(.turkish)
        DiyalogEngine.diyalogInstance().setenableCalls(true)
        
        DiyalogEngine.diyalogInstance().setisSupportBackButton(true)
        
        DiyalogEngine.diyalogInstance().createDiyalog()
                
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}


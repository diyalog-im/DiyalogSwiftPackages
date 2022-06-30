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

        DiyalogEngine.diyalogInstance().endpoints = ["wss://diyalog.im"]

        //Diyalog Test App
        DiyalogEngine.diyalogInstance().apiId = 241
        DiyalogEngine.diyalogInstance().apiKey = "454a6c44456930373243414a303746630564f4c7979707a46b55426d4f4c7772"
        
        DiyalogEngine.diyalogInstance().setappName("Deneme")
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


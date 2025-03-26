//
//  AppDelegate.swift
//  RIBS
//
//  Created by ADMIN on 3/24/25.
//

import RIBs
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var rootRouter: RootRouting?


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let rootBuilder = RootBuilder(dependency: AppComponent(window: window!))
        rootRouter = rootBuilder.build()
        rootRouter?.interactable.activate()
        rootRouter?.load()
        return true
    }

}

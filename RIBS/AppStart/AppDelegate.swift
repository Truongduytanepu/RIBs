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
    private var launchRouter: LaunchRouting?


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let rootBuilder = RootBuilder(dependency: AppComponent())
        let launchRouter = rootBuilder.build()
        self.launchRouter = launchRouter

        // 🔹 Lấy RootViewController từ Router
        let rootViewController = launchRouter.viewControllable.uiviewController
        
        // 🔹 Bọc vào NavigationController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = navigationController

        window.makeKeyAndVisible()

        launchRouter.launch(from: window)

        return true
    }

}

//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let tabBarCoordinator = TabBarCoordinatorFactory.makeTabBarNavigation()

        tabBarCoordinator.start()

        window = UIWindow()
        window?.rootViewController = tabBarCoordinator.tabBarController
        window?.makeKeyAndVisible()

        return true
    }

}


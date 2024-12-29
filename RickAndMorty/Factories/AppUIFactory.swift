//
//  AppUIFactory.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import UIKit

final class AppUIFactory {

    static func makePrimaryTabBarController() -> UITabBarController {

        let tabBarController = UITabBarController()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarController.tabBar.standardAppearance

        return tabBarController
    }

    static func makeNavigationController(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: rootViewController)

        return navigationController
    }

    static func makeNavigationControllerForFirstTab(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = makeNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = makeTabBarItemForFirstTab()

        return navigationController
    }

    static func makeNavigationControllerForSecondTab(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = makeNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = makeTabBarItemForSecondTab()

        return navigationController
    }

    static func makeNavigationControllerForThirdTab(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = makeNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = makeTabBarItemForThirdTab()

        return navigationController
    }

    private static func makeTabBarItemForFirstTab() -> UITabBarItem {
        let title = "First"
        let image = UIImage(systemName: "chevron.left")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }

    private static func makeTabBarItemForSecondTab() -> UITabBarItem {
        let title = "Second"
        let image = UIImage(systemName: "chevron.right")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }

    private static func makeTabBarItemForThirdTab() -> UITabBarItem {
        let title = "Third"
        let image = UIImage(systemName: "chevron.left")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }
}

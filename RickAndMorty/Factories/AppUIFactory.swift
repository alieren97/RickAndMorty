//
//  AppUIFactory.swift
//  RickAndMorty
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
        navigationController.tabBarItem = makeTabBarItemForCharactersTab()

        return navigationController
    }

    static func makeNavigationControllerForSecondTab(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = makeNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = makeTabBarItemForEpisodesTab()

        return navigationController
    }

    static func makeNavigationControllerForThirdTab(rootViewController: UIViewController) -> UINavigationController {

        let navigationController = makeNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = makeTabBarItemForLocationsTab()

        return navigationController
    }

    private static func makeTabBarItemForCharactersTab() -> UITabBarItem {
        let title = "Characters"
        let image = UIImage(systemName: "person.bust")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }

    private static func makeTabBarItemForEpisodesTab() -> UITabBarItem {
        let title = "Episodes"
        let image = UIImage(systemName: "sparkles.tv")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }

    private static func makeTabBarItemForLocationsTab() -> UITabBarItem {
        let title = "Locations"
        let image = UIImage(systemName: "location.viewfinder")
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)

        return tabBarItem
    }
}

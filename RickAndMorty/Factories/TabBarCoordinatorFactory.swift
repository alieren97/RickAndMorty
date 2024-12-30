//
//  TabBarCoordinatorFactory.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

final class TabBarCoordinatorFactory {

    static func makeTabBarNavigation() -> TabBarCoordinator {
        let tabBarCoordinator = TabBarCoordinatorImpl()
        return tabBarCoordinator
    }
}

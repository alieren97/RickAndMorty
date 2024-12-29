//
//  TabCoordinator.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import UIKit

protocol TabBarCoordinator: Coordinator {
    var tabBarController: UITabBarController { get set }
}

public final class TabBarCoordinatorImpl: TabBarCoordinator {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController

    init() {
        self.navigationController = UINavigationController()
        self.tabBarController = UITabBarController()
    }

    func start() {
        // Set up tab bar items and their view controllers

        let tabBarController = AppUIFactory.makePrimaryTabBarController()

        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()

        let firstNavController = AppUIFactory.makeNavigationControllerForFirstTab(rootViewController: firstVC)
        let secondNavController = AppUIFactory.makeNavigationControllerForSecondTab(rootViewController: secondVC)
        let thirdNavController = AppUIFactory.makeNavigationControllerForThirdTab(rootViewController: thirdVC)

        tabBarController.viewControllers = [firstNavController, secondNavController, thirdNavController]

        self.tabBarController = tabBarController
    }
}

final class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

final class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

final class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}

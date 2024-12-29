//
//  HomeBuilder.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import UIKit

final class HomeBuilder {

    static func make() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.viewModel = makeViewModel()
        return viewController
    }

    private static func makeViewModel() -> HomeViewModel {
        let viewModel = HomeViewModelImpl()
        viewModel.service = ServicesFactory.makeHomeViewService()
        return viewModel
    }
}

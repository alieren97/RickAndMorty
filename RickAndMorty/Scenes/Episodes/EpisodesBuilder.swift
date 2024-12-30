//
//  EpisodesBuilder.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class EpisodesBuilder {

    static func make() -> EpisodesViewController {
        let viewController = EpisodesViewController()
        viewController.viewModel = makeViewModel()
        return viewController
    }

    private static func makeViewModel() -> EpisodesViewModel {
        let viewModel = EpisodesViewModelImpl()
        viewModel.service = ServicesFactory.makeEpisodesViewService()
        return viewModel
    }
}

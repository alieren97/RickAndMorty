//
//  EpisodeDetailBuilder.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class EpisodeDetailBuilder {

    static func make(episodeId: Int) -> EpisodeDetailViewController {
        let viewController = EpisodeDetailViewController()
        viewController.viewModel = makeViewModel(episodeId: episodeId)
        return viewController
    }

    private static func makeViewModel(episodeId: Int) -> EpisodeDetailViewModel {
        let viewModel = EpisodeDetailViewModelImpl()
        viewModel.episodeId = episodeId
        viewModel.characterDetailService = ServicesFactory.makeCharacterDetailViewService()
        viewModel.service = ServicesFactory.makeEpisodeDetailViewService()
        return viewModel
    }
}

//
//  CharacterDetailBuilder.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class CharacterDetailBuilder {

    static func make(characterId: Int) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController()
        viewController.viewModel = makeViewModel(characterId: characterId)
        return viewController
    }

    private static func makeViewModel(characterId: Int) -> CharacterDetailViewModel {
        let viewModel = CharacterDetailViewModelImpl()
        viewModel.characterId = characterId
        viewModel.service = ServicesFactory.makeCharacterDetailViewService()
        return viewModel
    }
}

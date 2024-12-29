//
//  CharacterDetailContracts.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol CharacterDetailViewModel {
    var delegate: CharacterDetailViewModelDelegate? { get set }
    var service: CharacterDetailService! { get set }
    var characterId: Int? { get set }
    func prepareView()
}

enum CharacterDetailViewModelOutput {
    case setLoading(Bool)
    case showCharacter(RMCharacter)
    case showError(String)
}

protocol CharacterDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: CharacterDetailViewModelOutput)
}

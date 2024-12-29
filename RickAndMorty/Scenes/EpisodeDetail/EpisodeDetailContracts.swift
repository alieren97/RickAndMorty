//
//  EpisodeDetailContracts.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol EpisodeDetailViewModel {
    var delegate: EpisodeDetailViewModelDelegate? { get set }
    var service: EpisodeDetailService! { get set }
    var characterDetailService: CharacterDetailService! { get set }
    var episodeId: Int? { get set }
    func prepareView()
    func selectCharacter(at characterId: Int)
}

enum EpisodeDetailViewModelOutput {
    case setLoading(Bool)
    case showEpisode(RMEpisode)
    case showCharacters([RMCharacter])
    case showError(String)
}

enum EpisodesDetailViewRoute {
    case characterDetail(Int)
}

protocol EpisodeDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: EpisodeDetailViewModelOutput)
    func navigate(to route: EpisodesDetailViewRoute)

}

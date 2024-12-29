//
//  EpisodesContracts.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol EpisodesViewModel {
    var delegate: EpisodesViewModelDelegate? { get set }
    var service: EpisodesViewService? { get set }
    var episodesList: [RMEpisode] { get }
    func prepareView()
    func selectEpisode(at index: Int)
}

enum EpisodesViewModelOutput {
    case setLoading(Bool)
    case showEpisodes([RMEpisode])
    case showError(String)
}

enum EpisodesViewRoute {
    case episodeDetail(Int)
}

protocol EpisodesViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: EpisodesViewModelOutput)
    func navigate(to route: EpisodesViewRoute)
}

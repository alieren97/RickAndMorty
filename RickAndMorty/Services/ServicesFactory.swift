//
//  ServicesFactory.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

public final class ServicesFactory {

    static func makeHomeViewService() -> HomeViewService {
        let homeViewService = HomeViewServiceImpl()
        return homeViewService
    }
    
    static func makeEpisodesViewService() -> EpisodesViewService {
        let episodesViewService = EpisodesViewServiceImpl()
        return episodesViewService
    }

    static func makeLocationsViewService() -> LocationsViewService {
        let locationsViewService = LocationsViewServiceImpl()
        return locationsViewService
    }

    static func makeCharacterDetailViewService() -> CharacterDetailService {
        let characterDetailViewService = CharacterDetailServiceImpl()
        return characterDetailViewService
    }

    static func makeEpisodeDetailViewService() -> EpisodeDetailService {
        let episodeDetailViewService = EpisodeDetailServiceImpl()
        return episodeDetailViewService
    }
}

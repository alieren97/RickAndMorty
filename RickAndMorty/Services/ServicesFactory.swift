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
        let homeViewService = EpisodesViewServiceImpl()
        return homeViewService
    }
}

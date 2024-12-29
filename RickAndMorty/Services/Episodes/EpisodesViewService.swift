//
//  EpisodesViewService.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol EpisodesViewService {

    func getEpisodesList(completion: @escaping (Result<[RMEpisode], NetworkError>) -> Void)
}

//
//  EpisodeDetailService.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol EpisodeDetailService {

    func getEpisodeDetail(episodeId: Int,
                            completion: @escaping (Result<RMEpisode, NetworkError>) -> Void)
}

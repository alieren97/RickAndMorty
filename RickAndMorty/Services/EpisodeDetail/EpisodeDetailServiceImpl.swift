//
//  EpisodeDetailServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodeDetailServiceImpl: EpisodeDetailService {
    
    func getEpisodeDetail(episodeId: Int, completion: @escaping (Result<RMEpisode, NetworkError>) -> Void) {
        NetworkService.shared.request(type: RMEpisode.self, route: .getEpisode(episodeId)) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    
}

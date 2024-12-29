//
//  EpisodesViewServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodesViewServiceImpl: EpisodesViewService {
    func getEpisodesList(completion: @escaping (Result<[RMEpisode], NetworkError>) -> Void) {
        NetworkService.shared.request(type: RMBaseResponse<RMEpisode>.self, route: .getEpisodes) { result in
            switch result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
}

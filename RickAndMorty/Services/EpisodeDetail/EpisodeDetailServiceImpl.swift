//
//  EpisodeDetailServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodeDetailServiceImpl: EpisodeDetailService {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func getEpisodeDetail(episodeId: Int, completion: @escaping (Result<RMEpisode, NetworkError>) -> Void) {
        networkService.request(type: RMEpisode.self, route: .getEpisode(episodeId)) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    
}

//
//  EpisodesViewServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodesViewServiceImpl: EpisodesViewService {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func getEpisodesList(completion: @escaping (Result<[RMEpisode], NetworkError>) -> Void) {
        networkService.request(type: RMBaseResponse<RMEpisode>.self, route: .getEpisodes) { result in
            switch result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
}

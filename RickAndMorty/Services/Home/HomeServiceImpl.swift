//
//  HomeServiceImpl.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

final class HomeViewServiceImpl: HomeViewService {

    private let networkService: NetworkServiceProtocol

    // Modify the initializer to accept a NetworkService instance
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func getCharacterList(completion: @escaping (Result<[RMCharacter], NetworkError>) -> Void) {
        networkService.request(type: RMBaseResponse<RMCharacter>.self, route: .getCharacters) { result in
            switch result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}

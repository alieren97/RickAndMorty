//
//  CharacterDetailServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class CharacterDetailServiceImpl: CharacterDetailService {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func getCharacterDetail(characterId: Int, 
                            completion: @escaping (Result<RMCharacter, NetworkError>) -> Void) {
        networkService.request(type: RMCharacter.self, route: .getCharacter(characterId)) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

}

//
//  CharacterDetailServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class CharacterDetailServiceImpl: CharacterDetailService {
    
    func getCharacterDetail(characterId: Int, 
                            completion: @escaping (Result<RMCharacter, NetworkError>) -> Void) {
        NetworkService.shared.request(type: RMCharacter.self, route: .getCharacter(characterId)) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

}

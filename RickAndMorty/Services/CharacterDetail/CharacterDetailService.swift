//
//  CharacterDetailService.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol CharacterDetailService {

    func getCharacterDetail(characterId: Int,
                            completion: @escaping (Result<RMCharacter, NetworkError>) -> Void)
}

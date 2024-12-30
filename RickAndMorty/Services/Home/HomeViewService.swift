//
//  HomeViewService.swift
//  Recipe
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

public protocol HomeViewService {

    func getCharacterList(completion: @escaping (Result<[RMCharacter], NetworkError>) -> Void)
}

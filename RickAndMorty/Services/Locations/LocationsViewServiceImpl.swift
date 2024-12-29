//
//  LocationsViewServiceImpl.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class LocationsViewServiceImpl: LocationsViewService {
    func getLocations(completion: @escaping (Result<[RMLocation], NetworkError>) -> Void) {
        NetworkService.shared.request(type: RMBaseResponse<RMLocation>.self, route: .getLocations) { result in
            switch result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}

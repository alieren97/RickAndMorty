//
//  LocationsViewService.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol LocationsViewService {

    func getLocations(completion: @escaping (Result<[RMLocation], NetworkError>) -> Void)
}


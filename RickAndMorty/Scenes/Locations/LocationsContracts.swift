//
//  LocationsContracts.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

protocol LocationsViewModel {
    var delegate: LocationsViewModelDelegate? { get set }
    var service: LocationsViewService? { get set }
    var locationList: [RMLocation] { get }
    func prepareView()
}

enum LocationsViewModelOutput {
    case setLoading(Bool)
    case showLocations([RMLocation])
    case showError(String)
}

protocol LocationsViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: LocationsViewModelOutput)
}

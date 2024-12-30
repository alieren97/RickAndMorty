//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class LocationsViewModelImpl: LocationsViewModel {
    weak var delegate: LocationsViewModelDelegate?
    var service: LocationsViewService?

    var locationList = [RMLocation]()
    
    func prepareView() {
        notify(.setLoading(true))
        fetchLocations()
    }
    
    private func fetchLocations() {
        service?.getLocations(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.notify(.setLoading(false))
                self.locationList = data
                self.notify(.showLocations(data))
            case .failure(let failure):
                self.notify(.setLoading(false))
                self.notify(.showError(failure.localizedDescription))
            }
        })
    }

    private func notify(_ output: LocationsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

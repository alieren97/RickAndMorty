//
//  LocationsBuilder.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class LocationsBuilder {

    static func make() -> LocationsViewController {
        let viewController = LocationsViewController()
        viewController.viewModel = makeViewModel()
        return viewController
    }

    private static func makeViewModel() -> LocationsViewModel {
        let viewModel = LocationsViewModelImpl()
        viewModel.service = ServicesFactory.makeLocationsViewService()
        return viewModel
    }
}

//
//  LocationsViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class LocationsViewModelTest: XCTestCase {

    private var sut: LocationsViewModelImpl!
    private var delegate: MockLOcationsViewModelDelegate!
    private var service: MockLocationsViewService!

    override func setUp() {
        super.setUp()

        sut = LocationsViewModelImpl()

        delegate = MockLOcationsViewModelDelegate()
        sut.delegate = delegate

        service = MockLocationsViewService()
        sut.service = service
    }

    override func tearDown() {

        sut = nil
        delegate = nil
        service = nil
        super.tearDown()
    }

    func test_PrepareView_Error_HideLoadingIndicator() {

        service.error = .decodingError

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_ShowList_HideLoadingIndicator() {

        service.locationList = MockCharacterDataFactory.locationList

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_CharacterListNotEmpty() {

        service.locationList = MockCharacterDataFactory.locationList

        sut.prepareView()

        XCTAssertNotNil(delegate.locationList)
    }

    func test_PrepareView_CharacterListEmpty() {

        service.locationList = []

        sut.prepareView()

        XCTAssertEqual(delegate.locationList?.count, 0)
    }

    func test_FetchingCharacterList_Error() {

        service.error = .apiError("test")

        sut.prepareView()

        XCTAssertTrue(delegate.showError!)
    }
}

private class MockLOcationsViewModelDelegate: LocationsViewModelDelegate {

    var showLoadingIndicator: Bool?
    var showError: Bool?
    var locationList: [RMLocation]?

    func handleViewModelOutput(_ output: RickAndMorty.LocationsViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            showLoadingIndicator = bool
        case .showLocations(let array):
            locationList = array
        case .showError(_):
            showError = true
        }
    }
}

private class MockLocationsViewService: LocationsViewService {

    var locationList = [RMLocation]()
    var error: NetworkError?

    func getLocations(completion: @escaping (Result<[RickAndMorty.RMLocation], RickAndMorty.NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(locationList))
        }
    }

}

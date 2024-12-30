//
//  EpisodesViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodesViewModelTest: XCTestCase {

    private var sut: EpisodesViewModelImpl!
    private var delegate: MockEpisodesViewModelDelegate!
    private var service: MockEpisodeViewService!

    override func setUp() {
        super.setUp()

        sut = EpisodesViewModelImpl()

        delegate = MockEpisodesViewModelDelegate()
        sut.delegate = delegate

        service = MockEpisodeViewService()
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

        service.episodeList = MockCharacterDataFactory.episodeList

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_CharacterListNotEmpty() {

        service.episodeList = MockCharacterDataFactory.episodeList

        sut.prepareView()

        XCTAssertNotNil(delegate.episodeList)
    }

    func test_PrepareView_CharacterListEmpty() {

        service.episodeList = []

        sut.prepareView()

        XCTAssertEqual(delegate.episodeList?.count, 0)
    }

    func test_CharacterSelected_Is_NavigateCalled() {

        service.episodeList = MockCharacterDataFactory.episodeList

        sut.prepareView()
        sut.selectEpisode(at: 0)

        XCTAssertTrue(delegate.navigateEpisodeCalled!)
//        XCTAssertNotNil(delegate.selectedCharacter)
    }

    func test_FetchingCharacterList_Error() {

        service.error = .apiError("test")

        sut.prepareView()

        XCTAssertTrue(delegate.showError!)
    }
}

private class MockEpisodesViewModelDelegate: EpisodesViewModelDelegate {

    var showLoadingIndicator: Bool?
    var showError: Bool?
    var episodeList: [RMEpisode]?
    var navigateEpisodeCalled: Bool?

    func handleViewModelOutput(_ output: RickAndMorty.EpisodesViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            showLoadingIndicator = bool
        case .showEpisodes(let array):
            episodeList = array
        case .showError(_):
            showError = true
        }
    }

    func navigate(to route: RickAndMorty.EpisodesViewRoute) {
        switch route {
        case .episodeDetail(let id):
            navigateEpisodeCalled = true
        }

    }
}

private class MockEpisodeViewService: EpisodesViewService {

    var episodeList = [RMEpisode]()
    var error: NetworkError?

    func getEpisodesList(completion: @escaping (Result<[RickAndMorty.RMEpisode], RickAndMorty.NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(episodeList))
        }
    }

}


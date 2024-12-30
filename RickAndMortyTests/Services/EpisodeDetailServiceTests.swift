//
//  EpisodeDetailServiceTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodeDetailServiceTests: XCTestCase {

    private var sut: EpisodeDetailServiceImpl!
    private var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        // Initialize the mock network service
        mockNetworkService = MockNetworkService()
        // Inject the mock network service into the HomeViewServiceImpl
        sut = EpisodeDetailServiceImpl(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testGetCharacterListSuccess() {
        // Arrange
        let mockEpisodeId = 1
        let expectedEpisode = MockCharacterDataFactory.episode1
        mockNetworkService.mockResult = .success(expectedEpisode)

        // Act
        var receivedResult: Result<RMEpisode, NetworkError>?
        sut.getEpisodeDetail(episodeId: mockEpisodeId) { result in
            receivedResult = result
        }

        // Assert
        switch receivedResult {
        case .success(let episode):
            XCTAssertEqual(episode.episode, expectedEpisode.episode)
            XCTAssertEqual(episode.airDate, expectedEpisode.airDate)
        case .failure(let error):
            XCTFail("Expected success, but got failure: \(error)")
        default:
            XCTFail("Expected a result, but got nil")
        }
    }

    func testGetCharacterListFailure() {
        // Arrange
        let mockEpisodeId = 1
        let expectedError = NetworkError.requestFailed
        mockNetworkService.mockResult = .failure(expectedError)

        // Act
        var receivedResult: Result<RMEpisode, NetworkError>?
        sut.getEpisodeDetail(episodeId: mockEpisodeId) { result in
            receivedResult = result
        }

        // Assert
        switch receivedResult {
        case .success:
            XCTFail("Expected failure, but got success")
        case .failure(let error):
            XCTAssertEqual(error, expectedError, "The error should match the expected error.")
        default:
            XCTFail("Expected a result, but got nil")
        }
    }
}

private class MockNetworkService: NetworkServiceProtocol {

    var mockResult: Result<RMEpisode, NetworkError>?

    func request<T>(type: T.Type, route: RickAndMorty.APIRouter, completion: @escaping (Result<T, RickAndMorty.NetworkError>) -> Void) where T : Decodable {
        if let mockResult = mockResult as? Result<T, NetworkError> {
            completion(mockResult)
        }
    }
}

//
//  CharacterDetailViewServiceTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class CharacterDetailViewServiceTests: XCTestCase {

    private var sut: CharacterDetailServiceImpl!
    private var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        // Initialize the mock network service
        mockNetworkService = MockNetworkService()
        // Inject the mock network service into the HomeViewServiceImpl
        sut = CharacterDetailServiceImpl(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testGetCharacterListSuccess() {
        // Arrange
        let mockCharacterId = 1
        let expectedCharacter = MockCharacterDataFactory.rickCharacter
        mockNetworkService.mockResult = .success(expectedCharacter)

        // Act
        var receivedResult: Result<RMCharacter, NetworkError>?
        sut.getCharacterDetail(characterId: mockCharacterId) { result in
            receivedResult = result
        }

        // Assert
        switch receivedResult {
        case .success(let character):
            XCTAssertEqual(character.name, expectedCharacter.name)
            XCTAssertEqual(character.status, expectedCharacter.status)
        case .failure(let error):
            XCTFail("Expected success, but got failure: \(error)")
        default:
            XCTFail("Expected a result, but got nil")
        }
    }

    func testGetCharacterListFailure() {
        // Arrange
        let mockCharacterId = 1
        let expectedError = NetworkError.requestFailed
        mockNetworkService.mockResult = .failure(expectedError)

        // Act
        var receivedResult: Result<RMCharacter, NetworkError>?
        sut.getCharacterDetail(characterId: mockCharacterId) { result in
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

    var mockResult: Result<RMCharacter, NetworkError>?

    func request<T>(type: T.Type, route: RickAndMorty.APIRouter, completion: @escaping (Result<T, RickAndMorty.NetworkError>) -> Void) where T : Decodable {
        if let mockResult = mockResult as? Result<T, NetworkError> {
            completion(mockResult)
        }
    }
}

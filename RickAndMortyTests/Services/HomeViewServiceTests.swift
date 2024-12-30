//
//  HomeViewServiceTests.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class HomeViewServiceImplTests: XCTestCase {

    private var sut: HomeViewServiceImpl!
    private var mockNetworkService: MockNetworkService!

    override func setUp() {
        super.setUp()
        // Initialize the mock network service
        mockNetworkService = MockNetworkService()
        // Inject the mock network service into the HomeViewServiceImpl
        sut = HomeViewServiceImpl(networkService: mockNetworkService)
    }

    override func tearDown() {
        sut = nil
        mockNetworkService = nil
        super.tearDown()
    }

    func testGetCharacterListSuccess() {
        // Arrange
        let expectedCharacters = MockCharacterDataFactory.characterList
        mockNetworkService.mockResult = .success(RMBaseResponse(info: RMInfo(count: 0, pages: 0, next: "", prev: ""), results: expectedCharacters))

        // Act
        var receivedResult: Result<[RMCharacter], NetworkError>?
        sut.getCharacterList { result in
            receivedResult = result
        }

        // Assert
        switch receivedResult {
        case .success(let characters):
            XCTAssertEqual(characters.count, expectedCharacters.count, "The number of characters should match.")
            XCTAssertEqual(characters.first?.name, expectedCharacters.first?.name, "The first character's name should match.")
        case .failure(let error):
            XCTFail("Expected success, but got failure: \(error)")
        default:
            XCTFail("Expected a result, but got nil")
        }
    }

    func testGetCharacterListFailure() {
        // Arrange
        let expectedError = NetworkError.requestFailed
        mockNetworkService.mockResult = .failure(expectedError)

        // Act
        var receivedResult: Result<[RMCharacter], NetworkError>?
        sut.getCharacterList { result in
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

// Mock NetworkService class
private class MockNetworkService: NetworkServiceProtocol {

    var mockResult: Result<RMBaseResponse<RMCharacter>, NetworkError>?
    
    func request<T>(type: T.Type, route: RickAndMorty.APIRouter, completion: @escaping (Result<T, RickAndMorty.NetworkError>) -> Void) where T : Decodable {
        if let mockResult = mockResult as? Result<T, NetworkError> {
            completion(mockResult)
        }
    }
}

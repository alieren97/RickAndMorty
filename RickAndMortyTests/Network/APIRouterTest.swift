//
//  APIRouterTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
import Alamofire
@testable import RickAndMorty

final class APIRouterTests: XCTestCase {

    func testGetCharactersRequest() throws {
        // Arrange
        let router = APIRouter.getCharacters

        // Act
        let request = try router.asURLRequest()

        // Assert
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi.com/api/character")
        XCTAssertEqual(request.method, .get)
    }

    func testGetCharacterRequest() throws {
        // Arrange
        let characterId = 1
        let router = APIRouter.getCharacter(characterId)

        // Act
        let request = try router.asURLRequest()

        // Assert
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi.com/api/character/1")
        XCTAssertEqual(request.method, .get)
    }

    func testGetEpisodesRequest() throws {
        // Arrange
        let router = APIRouter.getEpisodes

        // Act
        let request = try router.asURLRequest()

        // Assert
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi.com/api/episode")
        XCTAssertEqual(request.method, .get)
    }

    func testGetEpisodeRequest() throws {
        // Arrange
        let episodeId = 10
        let router = APIRouter.getEpisode(episodeId)

        // Act
        let request = try router.asURLRequest()

        // Assert
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi.com/api/episode/10")
        XCTAssertEqual(request.method, .get)
    }

    func testGetLocationsRequest() throws {
        // Arrange
        let router = APIRouter.getLocations

        // Act
        let request = try router.asURLRequest()

        // Assert
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi.com/api/location")
        XCTAssertEqual(request.method, .get)
    }
}

extension String {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw AFError.invalidURL(url: self)
        }
        return url
    }
}

//
//  EpisodeDetailViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class EpisodeDetailViewModelTest: XCTestCase {

    private var sut: EpisodeDetailViewModelImpl!
    private var delegate: MockEpisodeDetailViewModelDelegate!
    private var service: MockEpisodeDetailService!
    private var characterDetailService: MockCharacterDetailService!

    private let mockEpisodeId: Int = 1

    override func setUp() {
        super.setUp()

        sut = EpisodeDetailViewModelImpl()

        delegate = MockEpisodeDetailViewModelDelegate()
        sut.delegate = delegate

        service = MockEpisodeDetailService()
        sut.service = service

        characterDetailService = MockCharacterDetailService()
        sut.characterDetailService = characterDetailService

        sut.episodeId = mockEpisodeId
    }

    override func tearDown() {

        sut = nil
        delegate = nil
        service = nil
        characterDetailService = nil
        super.tearDown()
    }

    func test_PrepareView_Error_HideLoadingIndicator() {

        service.error = .decodingError

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_ShowEpisode_HideLoadingIndicator() {

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_EpisodeNotNil_CheckId() {

        sut.prepareView()

        XCTAssertNotNil(delegate.episode)
        XCTAssertEqual(delegate.episode?.id, mockEpisodeId)
    }

    func test_FetchingEpisode_Error() {

        service.error = .apiError("test")

        sut.prepareView()

        XCTAssertTrue(delegate.showError!)
    }

    func test_Select_Character_CheckId() {
        let mockCharacterId = 2
        sut.prepareView()
        sut.selectCharacter(at: mockCharacterId)

        XCTAssertEqual(delegate.selectedCharacterId, mockCharacterId)
        XCTAssertTrue(delegate.navigateCharacterDetailCalled!)
    }

    func test_Check_EpisodeCharactersCount() {

        sut.prepareView()

        XCTAssertEqual(delegate.episode?.characters.count, 2)
    }
}

private class MockEpisodeDetailViewModelDelegate: EpisodeDetailViewModelDelegate {

    var showLoadingIndicator: Bool?
    var showError: Bool?
    var episode: RMEpisode?
    var navigateCharacterDetailCalled: Bool?
    var characters = [RMCharacter]()
    var selectedCharacterId: Int?

    func handleViewModelOutput(_ output: RickAndMorty.EpisodeDetailViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            showLoadingIndicator = bool
        case .showEpisode(let data):
            episode = data
        case .showError(_):
            showError = true
        case .showCharacters(let data):
            characters = data
        }
    }
    
    func navigate(to route: RickAndMorty.EpisodesDetailViewRoute) {
        switch route {
        case .characterDetail(let id):
            navigateCharacterDetailCalled = true
            selectedCharacterId = id
        }
    }
}

private class MockEpisodeDetailService: EpisodeDetailService {

    var character: RMEpisode?
    var error: NetworkError?

    func getEpisodeDetail(episodeId: Int, completion: @escaping (Result<RickAndMorty.RMEpisode, RickAndMorty.NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            let selectedEpisode = MockCharacterDataFactory.episodeList.first{ $0.id == episodeId}!
            completion(.success(selectedEpisode))
        }
    }
}

private class MockCharacterDetailService: CharacterDetailService {

    var character: RMCharacter?
    var error: NetworkError?

    func getCharacterDetail(characterId: Int, completion: @escaping (Result<RickAndMorty.RMCharacter, RickAndMorty.NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            let selectedCharacter = MockCharacterDataFactory.characterList.first{ $0.id == characterId}!
            completion(.success(selectedCharacter))
        }
    }

}


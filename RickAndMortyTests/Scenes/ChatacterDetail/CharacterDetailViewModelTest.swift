//
//  CharacterDetailViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class CharacterDetailViewModelTest: XCTestCase {

    private var sut: CharacterDetailViewModelImpl!
    private var delegate: MockCharacterDetailViewModelDelegate!
    private var service: MockCharacterDetailService!
    private let mockCharacterId: Int = 1
    
    override func setUp() {
        super.setUp()

        sut = CharacterDetailViewModelImpl()

        delegate = MockCharacterDetailViewModelDelegate()
        sut.delegate = delegate

        service = MockCharacterDetailService()
        sut.service = service

        sut.characterId = mockCharacterId
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

    func test_PrepareView_ShowCharacter_HideLoadingIndicator() {

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_CharacterNotNil() {

        sut.prepareView()

        XCTAssertNotNil(delegate.character)
        XCTAssertEqual(delegate.character?.id, mockCharacterId)
    }

    func test_FetchingCharacterList_Error() {

        service.error = .apiError("test")
        sut.prepareView()

        XCTAssertTrue(delegate.showError!)
    }
}

private class MockCharacterDetailViewModelDelegate: CharacterDetailViewModelDelegate {

    var showLoadingIndicator: Bool?
    var showError: Bool?
    var character: RMCharacter?
    var navigateEpisodeCalled: Bool?

    func handleViewModelOutput(_ output: RickAndMorty.CharacterDetailViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            showLoadingIndicator = bool
        case .showCharacter(let data):
            character = data
        case .showError(_):
            showError = true
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


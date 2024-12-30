//
//  HomeViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import XCTest
@testable import RickAndMorty

final class HomeViewModelTest: XCTestCase {

    private var sut: HomeViewModelImpl!
    private var delegate: MockHomeViewModelDelegate!
    private var service: MockHomeViewService!

    override func setUp() {
        super.setUp()

        sut = HomeViewModelImpl()

        delegate = MockHomeViewModelDelegate()
        sut.delegate = delegate

        service = MockHomeViewService()
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

        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()

        XCTAssertFalse(delegate.showLoadingIndicator!)
    }

    func test_PrepareView_CharacterListNotEmpty() {

        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()

        XCTAssertNotNil(delegate.characterList)
    }

    func test_PrepareView_CharacterListEmpty() {

        service.characterList = []

        sut.prepareView()

        XCTAssertEqual(delegate.characterList?.count, 0)
    }

    func test_CharacterSelected_Is_NavigateCalled() {
        let mockIndex = 0
        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()
        sut.selectCharacter(at: mockIndex)

        XCTAssertTrue(delegate.navigateCharacterCalled!)
        XCTAssertEqual(delegate.selectedCharacterId, MockCharacterDataFactory.characterList[mockIndex].id)
    }

    func test_FetchingCharacterList_Error() {

        service.error = .apiError("test")

        sut.prepareView()

        XCTAssertTrue(delegate.showError!)
    }

    func test_UpdateStatus_SelectedAll() {

        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()
        sut.updateStatus(with: .all)

        XCTAssertEqual(delegate.characterList?.count, MockCharacterDataFactory.characterList.count)
    }

    func test_UpdateStatus_SelectedDead_Equal_0() {

        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()
        sut.updateStatus(with: .dead)

        XCTAssertEqual(delegate.characterList?.count, 0)
    }

    func test_UpdateStatus_SelectedUnknown_Equal_0() {

        service.characterList = MockCharacterDataFactory.characterList

        sut.prepareView()
        sut.updateStatus(with: .unknown)

        XCTAssertEqual(delegate.characterList?.count, 0)
    }
}

private class MockHomeViewModelDelegate: HomeViewModelDelegate {

    var showLoadingIndicator: Bool?
    var showError: Bool?
    var characterList: [RMCharacter]?
    var navigateCharacterCalled: Bool?
    var selectedCharacterId: Int?

    func handleViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            showLoadingIndicator = bool
        case .showCharacterList(let array):
            characterList = array
        case .showError(_):
            showError = true
        }
    }

    func navigate(to route: HomeViewRoute) {
        switch route {
        case .characterDetail(let characterId):
            navigateCharacterCalled = true
            selectedCharacterId = characterId
        }

    }
}

private class MockHomeViewService: HomeViewService {

    var characterList = [RMCharacter]()
    var error: NetworkError?

    func getCharacterList(completion: @escaping (Result<[RMCharacter], NetworkError>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(characterList))
        }
    }

}

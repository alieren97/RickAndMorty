//
//  HomeViewControllerTest.swift
//  RickAndMortyTests
//
//  Created by Gedikoglu, Ali on 30.12.2024.
//

import XCTest
@testable import RickAndMorty

final class HomeViewControllerTest: XCTestCase {

    private var sut: HomeViewController!
    private var viewModel: MockHomeViewModelImpl!

    override func setUp() {
        super.setUp()

        sut = HomeViewController()

        viewModel = MockHomeViewModelImpl()
        sut.viewModel = viewModel

    }

    override func tearDown() {

        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func test_ViewDidLoadCalls_ViewModel() {
        sut.viewDidLoad()

        XCTAssertTrue(viewModel.isViewModelCalled!)
    }

}

private final class MockHomeViewModelImpl: HomeViewModel {
    var delegate: HomeViewModelDelegate?
    var service: HomeViewService?

    var isViewModelCalled: Bool?

    func prepareView() {
        isViewModelCalled = true
    }
    
    func selectCharacter(at index: Int) {

    }
    
    func updateStatus(with status: RickAndMorty.RMStatusEnum) {

    }
    
    func getCharacters() -> [RickAndMorty.RMCharacter] {
        return []
    }
    

}

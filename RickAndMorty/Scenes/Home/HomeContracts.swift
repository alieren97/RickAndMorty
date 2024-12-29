//
//  HomeContracts.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

protocol HomeViewModel {
    var delegate: HomeViewModelDelegate? { get set }
    var service: HomeViewService? { get set }
    var characterList: [RMCharacter] { get }
    func prepareView()
    func selectCharacter(at index: Int)
}

enum HomeViewModelOutput {
    case setLoading(Bool)
    case showCharacterList([RMCharacter])
    case showError(String)
}

enum HomeViewRoute {
    case characterDetail(RMCharacter)
}

protocol HomeViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: HomeViewModelOutput)
    func navigate(to route: HomeViewRoute)
}

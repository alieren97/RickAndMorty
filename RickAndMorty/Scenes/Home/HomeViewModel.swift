//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import Foundation

final class HomeViewModelImpl: HomeViewModel {

    weak var delegate: HomeViewModelDelegate?
    var service: HomeViewService?
    var characterList: [RMCharacter] = []

    func prepareView() {
        notify(.setLoading(true))
        fetchCharacters()
    }
    
    func selectCharacter(at index: Int) {
        let character = characterList[index]
        delegate?.navigate(to: .characterDetail(character.id))
    }

    private func notify(_ output: HomeViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

    private func fetchCharacters() {
        service?.getCharacterList(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.notify(.setLoading(false))
                self.characterList = data
                self.notify(.showCharacterList(data))
            case .failure(let failure):
                self.notify(.setLoading(false))
                self.notify(.showError(failure.localizedDescription))
            }
        })
    }
}

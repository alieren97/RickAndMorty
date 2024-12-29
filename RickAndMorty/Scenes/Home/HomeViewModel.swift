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
    private var originalCharacterList: [RMCharacter] = []
    private var updatedCharacterList: [RMCharacter] = []
    var status: RMStatusEnum = .all

    func prepareView() {
        notify(.setLoading(true))
        fetchCharacters()
    }
    
    func selectCharacter(at index: Int) {
        let id = getCharacters()[index].id
        delegate?.navigate(to: .characterDetail(id))
    }

    func updateStatus(with status: RMStatusEnum) {
        self.status = status
        switch status {
        case .all:
            notify(.showCharacterList(originalCharacterList))
        case .alive, .dead, .unknown:
            updatedCharacterList = originalCharacterList.filter { character in
                character.status == status
            }
            notify(.showCharacterList(updatedCharacterList))
        }
    }

    func getCharacters() -> [RMCharacter] {
        switch status {
        case .all:
            return originalCharacterList
        case .alive, .dead, .unknown:
            return updatedCharacterList
        }
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
                self.originalCharacterList = data
                self.notify(.showCharacterList(data))
            case .failure(let failure):
                self.notify(.setLoading(false))
                self.notify(.showError(failure.localizedDescription))
            }
        })
    }


}

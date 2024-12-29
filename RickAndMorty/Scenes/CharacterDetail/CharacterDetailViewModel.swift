//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class CharacterDetailViewModelImpl: CharacterDetailViewModel {

    weak var delegate: CharacterDetailViewModelDelegate?
    var service: CharacterDetailService!

    var characterId: Int?
    var characterDetail: RMCharacter?

    func prepareView() {
        notify(.setLoading(true))
        fetchCharacterDetail()
    }

    private func fetchCharacterDetail() {
        guard let characterId = characterId else { return }
        service.getCharacterDetail(characterId: characterId, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.notify(.setLoading(false))
                self.characterDetail = data
                self.notify(.showCharacter(data))
            case .failure(let failure):
                self.notify(.setLoading(false))
                self.notify(.showError(failure.localizedDescription))
            }
        })
    }

    private func notify(_ output: CharacterDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

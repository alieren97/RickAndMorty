//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodeDetailViewModelImpl: EpisodeDetailViewModel {

    weak var delegate: EpisodeDetailViewModelDelegate?
    var service: EpisodeDetailService!
    var characterDetailService: CharacterDetailService!

    var episodeDetail: RMEpisode?
    var characterList = [RMCharacter]()
    var episodeId: Int?
    
    func prepareView() {
        notify(.setLoading(true))
        fetchEpisodeDetail()
    }

    private func fetchEpisodeDetail() {
        guard let episodeId = episodeId else { return }
        service.getEpisodeDetail(episodeId: episodeId, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.episodeDetail = data
                self.notify(.showEpisode(data))
                self.fetchCharacters()
                self.notify(.setLoading(false))
            case .failure(let failure):
                self.notify(.showError(failure.localizedDescription))
                self.notify(.setLoading(false))
            }
        })
    }

    private func fetchCharacters() {

        guard let episodeDetail = episodeDetail else { return }
        let dispatchGroup = DispatchGroup()
        let numberOfRequests = min(10, episodeDetail.characters.count)
        for index in 0..<numberOfRequests {
            let urlString = episodeDetail.characters[index]
            if let id = extractID(from: urlString) {
                dispatchGroup.enter()
                guard let id = Int(id) else { return }
                characterDetailService.getCharacterDetail(characterId: id) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let data):
                        self.characterList.append(data)
                    case .failure(let failure):
                        print(failure)
                    }
                    dispatchGroup.leave()
                }
            }
        }

        dispatchGroup.notify(queue: .main) {
            self.notify(.showCharacters(self.characterList))
        }
    }

    func selectCharacter(at characterId: Int) {
        delegate?.navigate(to: .characterDetail(characterId))
    }

    private func notify(_ output: EpisodeDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

    // Function to extract the ID from the URL string
    private func extractID(from urlString: String) -> String? {
        guard let url = URL(string: urlString) else { return nil }

        // Extract the last path component (which is the ID)
        let lastPathComponent = url.lastPathComponent
        return lastPathComponent
    }

}

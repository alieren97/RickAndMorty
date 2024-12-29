//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import Foundation

final class EpisodesViewModelImpl: EpisodesViewModel {

    weak var delegate: EpisodesViewModelDelegate?
    var service:EpisodesViewService?

    var episodesList = [RMEpisode]()
    
    func prepareView() {
        notify(.setLoading(true))
        fetchEpisodes()
    }
    
    func selectEpisode(at index: Int) {
        let episodeId = episodesList[index].id
        delegate?.navigate(to: .episodeDetail(episodeId))
    }

    private func fetchEpisodes() {
        service?.getEpisodesList(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.notify(.setLoading(false))
                self.episodesList = data
                self.notify(.showEpisodes(data))
            case .failure(let failure):
                self.notify(.setLoading(false))
                self.notify(.showError(failure.localizedDescription))
            }
        })
    }

    private func notify(_ output: EpisodesViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

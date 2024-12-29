//
//  EpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {

    var viewModel: EpisodeDetailViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    private lazy var loadingView: RMLoadingView = {
        let loadingView = RMLoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()

    private lazy var episodeDetailView: EpisodeDetailView = {
        let view = EpisodeDetailView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayouts()
        viewModel.prepareView()
    }

    private func setupLayouts() {

        view.addSubview(episodeDetailView)

        NSLayoutConstraint.activate([
            episodeDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            episodeDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            episodeDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EpisodeDetailViewController: EpisodeDetailViewModelDelegate {

    func handleViewModelOutput(_ output: EpisodeDetailViewModelOutput) {
        switch output {
        case .setLoading(let showLoading):
            if showLoading {
                loadingView.show(in: self.view)
            } else {
                loadingView.hide()
            }
        case .showEpisode(let episode):
            episodeDetailView.configure(with: episode)
        case .showError(let error):
            print(error)
        case .showCharacters(let charaterList):
            episodeDetailView.showCharacterList(with: charaterList)
        }
    }
    
    func navigate(to route: EpisodesDetailViewRoute) {
        switch route {
        case .characterDetail(let characterId):
            let vc = CharacterDetailBuilder.make(characterId: characterId)
            show(vc, sender: self)
        }
    }
}

extension EpisodeDetailViewController: EpisodeDetailViewDelegate {
    func selectCharacter(characterId: Int) {
        viewModel.selectCharacter(at: characterId)
    }
}

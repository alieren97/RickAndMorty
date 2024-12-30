//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit
import Kingfisher

final class CharacterDetailViewController: UIViewController {

    var viewModel: CharacterDetailViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private lazy var loadingView: RMLoadingView = {
        let loadingView = RMLoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()

    private lazy var characterDetailView: CharacterDetailView = {
        let view = CharacterDetailView()
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

        view.addSubview(characterDetailView)

        NSLayoutConstraint.activate([
            characterDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func handleViewModelOutput(_ output: CharacterDetailViewModelOutput) {
        switch output {
        case .setLoading(let showLoading):
            if showLoading {
                loadingView.show(in: self.view)
            } else {
                loadingView.hide()
            }
        case .showCharacter(let character):
            characterDetailView.configure(with: character)
        case .showError(let string):
            print(string)
        }
    }
    

}

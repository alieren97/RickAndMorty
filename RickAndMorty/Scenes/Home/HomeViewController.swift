//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        viewModel.prepareView()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func handleViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showCharacterList(let data):
            print(data)
        case .showError(let error):
            print(error)
        }
    }
    
    func navigate(to route: HomeViewRoute) {
        switch route {
        case .characterDetail: break
        }
    }
    
}

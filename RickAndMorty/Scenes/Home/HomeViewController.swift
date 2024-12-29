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
    private var characterList = [RMCharacter]()

    private lazy var titleView: RMListTitleView = {
        let view = RMListTitleView()
        view.configure(title: "Characters")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(RMListCollectionViewCell.self, forCellWithReuseIdentifier: RMListCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let totalSpacing = spacing * 3 // Spacing between cells and edges
        let itemWidth = (view.bounds.width - totalSpacing) / 2 // Divide width into two cells
        layout.itemSize = CGSize(width: itemWidth, height: 250)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayouts()
        viewModel.prepareView()

    }

    private func setupLayouts() {

        view.addSubview(titleView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([

            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -16),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func handleViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showCharacterList(let data):
            characterList = data
            collectionView.reloadData()
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characterList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMListCollectionViewCell.reuseIdentifier, for: indexPath) as? RMListCollectionViewCell else {
            fatalError("Unable to dequeue RickAndMortyCollectionViewCell")
        }

        let character = characterList[indexPath.item]
        cell.configure(with: character)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectCharacter(at: indexPath.item)
    }
}

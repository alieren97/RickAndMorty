//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

protocol EpisodeDetailViewDelegate: AnyObject {
    func selectCharacter(characterId: Int)
}

final class EpisodeDetailView: UIView {

    weak var delegate: EpisodeDetailViewDelegate?

    private var characterList = [RMCharacter]()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    lazy var airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    lazy var episodeCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    lazy var charactersTitleLabel: RMListTitleView = {
        let view = RMListTitleView()
        view.configure(title: "Characters", fontSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(RMCharacterCarouselViewCell.self, forCellWithReuseIdentifier: RMCharacterCarouselViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: 150, height: 200)
        return layout
    }()


    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(nameLabel)
        addSubview(airDateLabel)
        addSubview(episodeCodeLabel)
        addSubview(charactersTitleLabel)
        addSubview(collectionView)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            airDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            episodeCodeLabel.topAnchor.constraint(equalTo: airDateLabel.bottomAnchor, constant: 10),
            episodeCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            charactersTitleLabel.topAnchor.constraint(equalTo: episodeCodeLabel.bottomAnchor, constant: 32),
            charactersTitleLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -16),
            charactersTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            collectionView.topAnchor.constraint(equalTo: charactersTitleLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    func configure(with episode: RMEpisode) {
        nameLabel.text = "Name: \(episode.name)"
        airDateLabel.text = "Air Date: \(episode.airDate)"
        episodeCodeLabel.text = "Episode: \(episode.episode)"
    }

    func showCharacterList(with characters: [RMCharacter]) {
        self.characterList = characters
        collectionView.reloadData()
    }
}

extension EpisodeDetailView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCarouselViewCell.reuseIdentifier, for: indexPath) as? RMCharacterCarouselViewCell else {
            fatalError("Unable to dequeue RMCharacterCarouselViewCell")
        }

        let character = characterList[indexPath.item]
        cell.configure(with: character)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectCharacter(characterId: characterList[indexPath.item].id)
    }
}

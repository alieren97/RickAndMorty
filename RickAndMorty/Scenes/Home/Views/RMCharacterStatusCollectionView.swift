//
//  RMCharacterStatusCollectionView.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

protocol RMCharacterStatusCollectionViewDelegate: AnyObject {
    func selectStatus(with status: RMStatusEnum)
}

final class RMCharacterStatusCollectionView: UIView {

    weak var delegate: RMCharacterStatusCollectionViewDelegate?

    private let status: [RMStatusEnum] = RMStatusEnum.allCases
    var selectedIndex: IndexPath?

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(RMCharacterStatusCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterStatusCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 100, height: 35)
        return layout
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
        selectedIndex = IndexPath(item: 0, section: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(collectionView)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension RMCharacterStatusCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return status.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterStatusCollectionViewCell.reuseIdentifier, for: indexPath) as? RMCharacterStatusCollectionViewCell else {
            fatalError("Unable to dequeue RMCharacterStatusCollectionViewCell")
        }

        let status = status[indexPath.item]
        cell.configure(with: status, isSelected: selectedIndex == indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath
        delegate?.selectStatus(with: status[indexPath.item])
        collectionView.reloadData()
    }
}


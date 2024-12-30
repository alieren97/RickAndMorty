//
//  RMCharacterCarouselViewCell.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit
import Kingfisher

final class RMCharacterCarouselViewCell: UICollectionViewCell {
    static let reuseIdentifier = "RMCharacterCarouselViewCell"

    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        contentView.addSubview(characterImageView)

        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }

    func configure(with character: RMCharacter) {
        if let imageUrl = URL(string: character.image) {
            characterImageView.kf.setImage(with: imageUrl)
        } else {
            characterImageView.image = nil
        }
    }
}

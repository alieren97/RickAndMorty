//
//  RMCharacterStatusCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class RMCharacterStatusCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "RMCharacterStatusCollectionViewCell"

    lazy var statusTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {

        contentView.addSubview(statusTitleLabel)

        NSLayoutConstraint.activate([
            statusTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            statusTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    func configure(with status: RMStatusEnum, isSelected: Bool) {
        statusTitleLabel.text = status.rawValue
        contentView.backgroundColor = isSelected ? status.backgroundColor : .clear
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.cornerRadius = 16
    }
}

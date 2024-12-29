//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

class RMLocationTableViewCell: UITableViewCell {

    static let reuseIdentifier = "RMLocationTableViewCell"

    // MARK: - Subviews
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var dimensionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Setup UI
    private func setupUI() {
        selectionStyle = .none

        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(dimensionLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8),
            dimensionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dimensionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dimensionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    // MARK: - Configuration
    func configure(with location: RMLocation) {
        nameLabel.text = location.name
        typeLabel.text = "Type: \(location.type)"
        dimensionLabel.text = "Dimension: \(location.dimension)"
    }
}

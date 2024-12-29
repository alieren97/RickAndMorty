//
//  RMEpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

class RMEpisodesTableViewCell: UITableViewCell {

    static let reuseIdentifier = "RMEpisodesTableViewCell"

    // MARK: - Subviews
    lazy var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var episodeCodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var airDateLabel: UILabel = {
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
        contentView.addSubview(episodeNameLabel)
        contentView.addSubview(episodeCodeLabel)
        contentView.addSubview(airDateLabel)

        NSLayoutConstraint.activate([
            // Episode name label
            episodeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            episodeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            episodeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // Episode code label
            episodeCodeLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 4),
            episodeCodeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            episodeCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // Air date label
            airDateLabel.topAnchor.constraint(equalTo: episodeCodeLabel.bottomAnchor, constant: 4),
            airDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            airDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            airDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    // MARK: - Configuration
    func configure(with episode: RMEpisode) {
        episodeNameLabel.text = episode.name
        episodeCodeLabel.text = episode.episode
        airDateLabel.text = "Air Date: \(episode.airDate)"
    }
}

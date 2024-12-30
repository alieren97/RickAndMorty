//
//  RMListTitleView.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class RMListTitleView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick And Morty"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 8, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.trailingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor, constant: -16),

            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            subTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }

    func configure(title: String, fontSize: CGFloat = 30) {
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
}

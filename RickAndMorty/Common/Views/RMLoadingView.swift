//
//  RMLoadingview.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

class RMLoadingView: UIView {

    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    private let backgroundView: UIView

    override init(frame: CGRect) {
        backgroundView = UIView(frame: frame)
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        backgroundView = UIView()
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        // Set background color with transparency
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
        backgroundView.frame = self.bounds
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(backgroundView)

        // Configure activity indicator
        loadingIndicator.center = self.center
        loadingIndicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        loadingIndicator.startAnimating()
        addSubview(loadingIndicator)
    }

    func show(in view: UIView) {
        view.addSubview(self)
        frame = view.bounds
    }

    func hide() {
        removeFromSuperview()
    }
}

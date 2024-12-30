//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class EpisodesViewController: UIViewController {

    private var episodeList = [RMEpisode]()

    var viewModel: EpisodesViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    private lazy var titleView: RMListTitleView = {
        let view = RMListTitleView()
        view.configure(title: "Episodes")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RMEpisodesTableViewCell.self, forCellReuseIdentifier: RMEpisodesTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.prepareView()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleView)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -16),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension EpisodesViewController: EpisodesViewModelDelegate {
    func handleViewModelOutput(_ output: EpisodesViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showEpisodes(let data):
            episodeList = data
            tableView.reloadData()
        case .showError(let string):
            print(string)
        }
    }

    func navigate(to route: EpisodesViewRoute) {
        switch route {
        case .episodeDetail(let id):
            let vc = EpisodeDetailBuilder.make(episodeId: id)
            show(vc, sender: self)
        }
    }

}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMEpisodesTableViewCell.reuseIdentifier, for: indexPath) as? RMEpisodesTableViewCell else {
            return UITableViewCell()
        }
        let episode = episodeList[indexPath.row]
        cell.backgroundColor = .clear
        cell.configure(with: episode)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectEpisode(at: indexPath.row)
    }
}

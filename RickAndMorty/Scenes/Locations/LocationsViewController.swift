//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 29.12.2024.
//

import UIKit

final class LocationsViewController: UIViewController {

    private var locationList = [RMLocation]()
    var viewModel: LocationsViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    private lazy var titleView: RMListTitleView = {
        let view = RMListTitleView()
        view.configure(title: "Locations")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RMLocationTableViewCell.self, forCellReuseIdentifier: RMLocationTableViewCell.reuseIdentifier)
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

            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LocationsViewController: LocationsViewModelDelegate {
    func handleViewModelOutput(_ output: LocationsViewModelOutput) {
        switch output {
        case .setLoading(let bool):
            print(bool)
        case .showLocations(let data):
            locationList = data
            tableView.reloadData()
        case .showError(let string):
            print(string)
        }
    }
}


extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RMLocationTableViewCell.reuseIdentifier, for: indexPath) as? RMLocationTableViewCell else {
            return UITableViewCell()
        }
        let location = locationList[indexPath.row]
        cell.backgroundColor = .clear
        cell.configure(with: location)
        return cell
    }
}

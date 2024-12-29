//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Gedikoglu, Ali on 28.12.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

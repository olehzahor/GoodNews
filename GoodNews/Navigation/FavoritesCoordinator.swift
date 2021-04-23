//
//  FavoritesCoordinator.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import Foundation

class FavoritesCoordinator: MainCoordinator {
    override func start() {
        let vc = FavoritesViewController()
        vc.coordinator = self
        vc.load(from: FavoriteArticlesController.shared)
        vc.tabBarItem = .init(tabBarSystemItem: .favorites, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}

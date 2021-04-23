//
//  SearchCoordinator.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import Foundation

class SearchCoordinator: MainCoordinator {
    override func start() {
        let vc = SearchViewController()
        vc.coordinator = self
        vc.tabBarItem = .init(tabBarSystemItem: .search, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}

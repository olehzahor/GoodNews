//
//  MainCoordinator.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit
import WebKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let vc = NewsViewController()
        vc.coordinator = self
        vc.tabBarItem = .init(tabBarSystemItem: .mostRecent, tag: 0)
        vc.load(from: TopNewsController())
        navigationController.pushViewController(vc, animated: false)
    }

    func showArticle(_ article: Article) {
        let vc = ArticleViewController()
        vc.article = article
        navigationController.pushViewController(vc, animated: true)
    }    

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init() {
        self.init(navigationController: UINavigationController())
    }
}

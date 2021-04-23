//
//  MainTabBarController.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    let coordinators: [Coordinator] = {
        let mainCoordinator = MainCoordinator()
        let favoritesCoordinator = FavoritesCoordinator()
        let searchCoordinator = SearchCoordinator()
        
        return [mainCoordinator, favoritesCoordinator, searchCoordinator]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        tabBar.standardAppearance = appearance
        
        coordinators.forEach { $0.start() }
        
        viewControllers = coordinators.compactMap { $0.navigationController }
    }
    
}

//
//  FavoritesViewController.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

class FavoritesViewController: NewsViewController {
    override func viewWillAppear(_ animated: Bool) {
        load(from: newsController)
    }
}

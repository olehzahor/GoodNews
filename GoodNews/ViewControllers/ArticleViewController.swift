//
//  ArticleViewController.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    var article: Article!
    
    fileprivate func setupWebView(_ url: URL) {
        let webView = WKWebView()
        view = webView
        webView.load(URLRequest(url: url))
    }
    
    @objc func addToFavorites() {
        FavoriteArticlesController.shared.add(article: article)
        setupNavBarButtons()
    }
    
    @objc func removeFromFavorites() {
        let articleCopy = Article(value: article as Any)
        FavoriteArticlesController.shared.remove(article: article)
        article = articleCopy
        setupNavBarButtons()
    }

    
    fileprivate func setupNavBarButtons() {
        let addToFavsButton = UIBarButtonItem(
            image: UIImage(systemName: "bookmark"),
            style: .plain,
            target: self,
            action: #selector(addToFavorites))
        
        let removeFromWFavsButton = UIBarButtonItem(
            image: UIImage(systemName: "bookmark.slash"),
            style: .plain,
            target: self,
            action: #selector(removeFromFavorites))
        
        self.navigationItem.rightBarButtonItem =
            FavoriteArticlesController.shared.contains(article: article)
            ? removeFromWFavsButton : addToFavsButton
    }
    
    override func viewDidLoad() {
        guard let url = article.viewModel.url else { return }
        
        title = article.viewModel.title
        
        setupWebView(url)
        
        if let storedArticle = FavoriteArticlesController.shared.find(article: article) {
            self.article = storedArticle
        }
        
        setupNavBarButtons()
    }
}

//
//  ViewController.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import UIKit
import SDWebImage

class NewsViewController: UITableViewController {
    weak var coordinator: MainCoordinator?
    var newsController: NewsController?
    var favoritesController = FavoriteArticlesController.shared
    
    var articles: [Article] = []
    
    func update(with controller: NewsController) {
        articles = controller.articles
        tableView.reloadData()
    }
    
    func load(from controller: NewsController?) {
        self.newsController = controller
        title = newsController?.title
        controller?.load(completion: update(with:))
    }
    
    @objc func refresh() {
        newsController?.load(completion: update(with:))
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.insetsContentViewsToSafeArea = true
        
        tableView.registerCell(ArticleCell.self)
        tableView.registerCell(PlaceholderCell.self)
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
}

extension NewsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        
        if article == Article.placeholder {
            newsController?.loadMore(completion: update(with:))
            return tableView.dequeueCell(PlaceholderCell.self, for: indexPath)
        } else {
            let cell = tableView.dequeueCell(ArticleCell.self, for: indexPath)
            article.viewModel.configure(cell)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = newsController?.articles[indexPath.row] else { return }
        
        let newArticle = Article(value: article)
        
        coordinator?.showArticle(newArticle)
    }
}


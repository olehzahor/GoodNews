//
//  FavoriteArticlesController.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import Foundation

class FavoriteArticlesController {
    private var dataStore = RealmDataStore<Article>(sortBy: "publishedAt")
    
    func find(article: Article) -> Article? {
        dataStore.find(article)
    }
    
    func contains(article: Article) -> Bool {
        dataStore.contains(article)
    }
    
    func add(article: Article) {
        dataStore.append([article])
    }
    
    func remove(article: Article) {
        dataStore.remove([article])
    }
    
    static let shared = FavoriteArticlesController()
    private init() {}
}

extension FavoriteArticlesController: NewsController {
    var title: String { return "Favorite News" }
    
    var articles: [Article] {
        dataStore.items
    }
        
    func load(completion: @escaping (NewsController) -> Void) {
        completion(self)
    }
    
    func loadMore(completion: @escaping (NewsController) -> Void) {
        completion(self)
    }

}

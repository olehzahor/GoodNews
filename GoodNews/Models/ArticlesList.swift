//
//  ArticlesList.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import Foundation

class ArticlesList {
    private(set) var items: [Article] = []
    
    private var lastLoadedPage: Int = 0
    var nextPageToLoad: Int {
        return lastLoadedPage + 1
    }
    
    private var total: Int = 0
    private var loaded: Int {
        return items.count
    }
    
    var isOnLastPage: Bool {
        return total == loaded
    }
    
    func update(with response: NewsApiResponse) {
        lastLoadedPage += 1
        total = response.totalResults
        
        for article in response.articles {
            if self.items.contains(article) { continue }
            items.append(article)
        }
    }
}

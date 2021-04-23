//
//  NewsResponseHandler.swift
//  GoodNews
//
//  Created by jjurlits on 4/23/21.
//

import Foundation

class NewsResponseHandler {
    internal var articlesList = ArticlesList()
    internal var dataTask: URLSessionTask?
   
    var error: Error?
    
    internal func responseHandler(_ result: Result<NewsApiResponse, Error>,
                                 controller: NewsController,
                                 completion: @escaping (NewsController) -> Void) {
        switch result {
        case .success(let response):
            self.articlesList.update(with: response)
            self.error = nil
        case .failure(let error):
            print(error)
            self.error = error
        }
        completion(controller)
    }
    
    func reset() {
        dataTask?.cancel()
        articlesList = ArticlesList()
    }
    
    var wrappedAtricles: [Article] {
        var articles = articlesList.items
        if !articlesList.isOnLastPage, error == nil {
            articles.append(Article.placeholder)
        }
        return articles
    }
    
    deinit {
        dataTask?.cancel()
    }
}

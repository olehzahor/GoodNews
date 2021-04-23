//
//  NewsSearchController.swift
//  GoodNews
//
//  Created by jjurlits on 4/23/21.
//

import Foundation

class NewsSearchController: NewsController {
    var title: String = ""
    
    let responseHandler = NewsResponseHandler()
    
    var query: String? {
        didSet { responseHandler.reset() }
    }
    
    var articles: [Article] {
        responseHandler.wrappedAtricles
    }
    
    func load(completion: @escaping (NewsController) -> Void) {
        guard let query = query else { return }
        responseHandler.reset()
        responseHandler.dataTask = NewsApi.shared.getNews(contains: query) { result in
            self.responseHandler.responseHandler(
                result, controller: self, completion: completion)
        }
    }
    
    func loadMore(completion: @escaping (NewsController) -> Void) {
        guard let query = query else { return }
        responseHandler.dataTask = NewsApi.shared.getNews(
            contains: query,
            page: responseHandler.articlesList.nextPageToLoad) { result in
            self.responseHandler.responseHandler(
                result, controller: self, completion: completion)
        }
    }
}

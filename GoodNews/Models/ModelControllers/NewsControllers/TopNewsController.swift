//
//  TopNewsController.swift
//  GoodNews
//
//  Created by jjurlits on 4/23/21.
//

import Foundation

class TopNewsController: NewsController {
    var title: String = "Top News"
    
    let responseHandler = NewsResponseHandler()
    
    var articles: [Article] {
        responseHandler.wrappedAtricles
    }
    
    func load(completion: @escaping (NewsController) -> Void) {
        responseHandler.reset()
        responseHandler.dataTask = NewsApi.shared.getTopNews { result in
            self.responseHandler.responseHandler(
                result, controller: self, completion: completion)
        }
    }
    
    func loadMore(completion: @escaping (NewsController) -> Void) {
        responseHandler.dataTask = NewsApi.shared.getTopNews(
            page: responseHandler.articlesList.nextPageToLoad) { result in
            self.responseHandler.responseHandler(
                result, controller: self, completion: completion)
        }
    }
}

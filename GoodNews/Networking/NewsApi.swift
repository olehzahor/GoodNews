//
//  NewsApi.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import Foundation

class NewsApi: ApiService {
    typealias CompletionHandler = (Result<NewsApiResponse, Error>) -> Void
    
    lazy var endpoints = NewsEndpoints(apiKey: NEWS_API_KEY)
    
    @discardableResult
    func getNews(contains query: String, page: Int = 1, completion: @escaping CompletionHandler) -> URLSessionTask? {
        fetch(url: endpoints.allNews(contains: query, page: page), completion: completion)
    }

    @discardableResult
    func getTopNews(page: Int = 1, completion: @escaping CompletionHandler) -> URLSessionTask? {
        fetch(url: endpoints.topNews(page: page), completion: completion)
    }

    static let shared = NewsApi()
    private override init() {
        super.init()
    }
}

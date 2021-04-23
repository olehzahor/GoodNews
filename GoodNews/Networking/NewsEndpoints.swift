//
//  NewsApiEndpoints.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import Foundation

class NewsEndpoints {
    private let apiKey: String
    
    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/"
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
        ]
        return components
    }
    
    private func constructURL(path: String, queryItems: [URLQueryItem]? = nil) -> URL? {
        var components = baseComponents
        components.path += path
        components.queryItems?.append(contentsOf: queryItems ?? [])
        return components.url
    }

    func allNews(contains query: String, page: Int = 1) -> URL? {
        let queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "sortBy", value: "publishedAt")
        ]
        return constructURL(path: "everything", queryItems: queryItems)
    }
    
    func topNews(page: Int = 1) -> URL? {
        let queryItems = [
            URLQueryItem(name: "country", value: Locale.current.regionCode ?? "ua"),
            URLQueryItem(name: "page", value: String(page)),
        ]
        return constructURL(path: "top-headlines", queryItems: queryItems)
    }

    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

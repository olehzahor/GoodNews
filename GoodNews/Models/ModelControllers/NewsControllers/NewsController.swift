//
//  NewsController.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import Foundation

protocol NewsController {
    var articles: [Article] { get }
    var title: String { get }
    func load(completion: @escaping (NewsController) -> Void)
    func loadMore(completion: @escaping (NewsController) -> Void)
}

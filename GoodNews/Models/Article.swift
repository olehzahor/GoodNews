//
//  Article.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import Foundation
import RealmSwift

struct NewsApiResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}

class Source: Object, Decodable {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
}

class Article: Object, Decodable {
    @objc dynamic var source: Source?
    @objc dynamic var author: String?
    @objc dynamic var title: String?
    @objc dynamic var shortText: String?
    @objc dynamic var url: String?
    @objc dynamic var urlToImage: String?
    @objc dynamic var publishedAt: String?
    @objc dynamic var content: String?
    
    override class func primaryKey() -> String? {
        return "title"
    }
    
    enum CodingKeys: String, CodingKey {
        case shortText = "description"
        case source, author, title, url,
             urlToImage, publishedAt, content
    }
}

extension Article {
    var publishedAtDate: Date? {
        guard let publishedAt = publishedAt else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: publishedAt)
    }
}

extension Article {
    static let placeholder = Article()
}


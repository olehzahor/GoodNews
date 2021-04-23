//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

class ArticleViewModel {
    private var article: Article
    
    let placeholderImage = UIImage(named: "placeholder")
    
    var title: String { return article.title ?? "" }
    var description: String { return article.shortText ?? "" }
    var author: String { return article.author ?? "" }
    var source: String { return article.source?.name ?? "" }
    
    var imageUrl: URL? {
        guard let urlToImage = article.urlToImage else { return nil }
        return URL(string: urlToImage)
    }
    
    var url: URL? {
        guard let url = article.url else { return nil }
        return URL(string: url)
    }
    
    var publishedAt: String {
        guard let date = article.publishedAtDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    init(article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    func configure(_ cell: ArticleCell) {
        if imageUrl != nil {
            cell.articleImageView.show()
            cell.articleImageView.sd_setImage(with: imageUrl,
                                              placeholderImage: placeholderImage)
        } else {
            cell.articleImageView.hide()
        }
        
        cell.sourceLabel.text = "\(publishedAt) | \(source)"
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.authorLabel.text = "© \(author)"
    }
}

extension Article {
    var viewModel: ArticleViewModel {
        return ArticleViewModel(article: self)
    }
}

//
//  ArticleCell.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import UIKit

class ArticleCell: ProgrammaticTableViewCell, SelfConfiguringView {
    let articleImageView: UIImageView = createView {
        $0.sd_imageTransition = .fade
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.tintColor = .tertiarySystemBackground
    }
    
    let sourceLabel: UILabel = createView {
        $0.font = .preferredFont(forTextStyle: .subheadline)
        $0.textColor = .secondaryLabel
    }
    
    let titleLabel: UILabel = createView {
        $0.font = .preferredFont(forTextStyle: .title3)
        $0.numberOfLines = 0
    }
    
    let descriptionLabel: UILabel = createView {
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.numberOfLines = 5
    }
    
    let authorLabel: UILabel = createView {
        $0.font = .preferredFont(forTextStyle: .footnote)
        $0.textColor = .tertiaryLabel
    }
    
    override func setupViews() {
        let vStack = UIStackView(arrangedSubviews: [sourceLabel, articleImageView, titleLabel, descriptionLabel, authorLabel])
        contentView.addSubview(vStack)
        
        articleImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        vStack.axis = .vertical
        vStack.spacing = 8
        
        vStack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}

//
//  PlaceholderCell.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

class PlaceholderCell: ProgrammaticTableViewCell, SelfConfiguringView {
    var spinner: UIActivityIndicatorView = createView {
        $0.hidesWhenStopped = true
    }
    
    override func prepareForReuse() {
        spinner.startAnimating()
    }
    
    override func setupViews() {
        contentView.addSubview(spinner)
        spinner.centerInSuperview()
        spinner.startAnimating()
    }
}

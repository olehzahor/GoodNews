//
//  ProgrammaticTableViewCell.swift
//  GoodNews
//
//  Created by jjurlits on 4/21/21.
//

import UIKit

class ProgrammaticTableViewCell: UITableViewCell {
    static func createView<T: UIView>(configurator: ((T)->())? = nil) -> T {
        let view = T()
        configurator?(view)
        return view
    }
    
    func setupViews() { }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

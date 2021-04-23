//
//  UITableView+Cells.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

extension UITableView {
    func registerCell<T: SelfConfiguringView>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueCell<T: SelfConfiguringView>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Unable to dequeue \(cellClass)")
        }
        return cell
    }
}

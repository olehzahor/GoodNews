//
//  Coordinator.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

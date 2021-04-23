//
//  DataStore.swift
//  GoodNews
//
//  Created by jjurlits on 4/23/21.
//

import Foundation

protocol DataStore {
    associatedtype T
    var items: [T] { get }
    func find(_ item: T) -> T?
    func contains(_ item: T) -> Bool
    func append(_ items: [T])
    func remove(_ items: [T])
    func clear()
}

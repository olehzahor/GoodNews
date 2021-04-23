//
//  RealmDataStore.swift
//  GoodNews
//
//  Created by jjurlits on 4/23/21.
//

import Foundation
import RealmSwift

class RealmDataStore<T: Object>: DataStore {
    private var results: Results<T>?
    private var realm: Realm?
    
    private var sortingKey: String

    var items: [T] {
        return fetchAll().compactMap { $0 }
    }
    
    func find(_ item: T) -> T? {
        if let primaryKey = T.primaryKey(), let pkValue = item.value(forKey: primaryKey) {
            return realm?.object(ofType: T.self, forPrimaryKey: pkValue)
        } else { return nil }
    }
    
    func contains(_ item: T) -> Bool {
        find(item) != nil
    }
    
    func append(_ items: [T]) {
        try? realm?.write {
            realm?.add(items)
        }
    }
    
    func remove(_ items: [T]) {
        try? realm?.write {
            realm?.delete(items)
        }
    }
    
    func clear() {
        try? realm?.write {
            realm?.deleteAll()
        }
    }
    
    func fetchAll() -> Results<T> {
        if let results = realm?.objects(T.self) {
            return results.sorted(byKeyPath: self.sortingKey, ascending: false)
        } else {
            fatalError("Cannot load objects from Realm.")
        }
    }
    
    init(sortBy keyPath: String) {
        self.realm = try? Realm()
        self.sortingKey = keyPath
        self.results = fetchAll()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
}

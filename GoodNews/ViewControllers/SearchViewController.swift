//
//  HomeViewController.swift
//  GoodNews
//
//  Created by jjurlits on 4/22/21.
//

import UIKit

class SearchViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    private var searchController: UISearchController?
    private var resultsController: NewsViewController?
    
    private var newsSearchController: NewsSearchController?

    fileprivate func setupSearchController() {
        resultsController = NewsViewController()
        resultsController?.coordinator = self.coordinator
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController?.delegate = self
        
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.autocapitalizationType = .none
        searchController?.searchBar.delegate = self
        searchController?.searchBar.placeholder = "Search for news"
        navigationItem.hidesSearchBarWhenScrolling = false
        
        navigationItem.searchController = searchController
    }
    
    override func viewDidLoad() {
        setupSearchController()
        title = "Search"
    }
}

extension SearchViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty
        else { return }
        
        if newsSearchController == nil {
            newsSearchController = NewsSearchController()
        }
        
        newsSearchController?.query = searchText
        resultsController?.load(from: newsSearchController)
    }
    
}

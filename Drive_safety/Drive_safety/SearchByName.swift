//
//  SearchByName.swift
//  Drive_safety
//
//  Created by kpugame on 2020/06/10.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class SearchByName: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Insert Local Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    //검색창이 비어있는지 확인
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}

extension SearchByName: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

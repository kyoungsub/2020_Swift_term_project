//
//  SearchByName.swift
//  Drive_safety
//
//  Created by kpugame on 2020/06/10.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class SearchByName: UITableViewController {
    
    var filteredLocals = [siDo]()
    let searchController = UISearchController(searchResultsController: nil)
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredLocals.count
        }
        return siDoCode.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
        let sido: siDo
        if isFiltering() {
            sido = filteredLocals[indexPath.row]
        }
        else {
            sido = siDoCode[indexPath.row]
        }
      cell.textLabel!.text = sido.name
      return cell
    }
    
    //검색창이 비어있는지 확인
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "ALL") {
        filteredLocals = siDoCode.filter({( sido : siDo ) -> Bool in
            return sido.name!.contains(searchText)
        })
        
        tableView.reloadData()
    }
}

extension SearchByName: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

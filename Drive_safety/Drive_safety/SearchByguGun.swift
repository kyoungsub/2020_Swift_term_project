//
//  SearchByguGun.swift
//  Drive_safety
//
//  Created by kpugame on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class SearchByguGun: UITableViewController{
    var guGuns = [guGun]()
    var filteredLocals = [guGun]()
    var siDo_code:Int = 0
    var guGun_code:Int = 0
    let searchController = UISearchController(searchResultsController: nil)
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func loadguGunCode(){
        if siDo_code == 11{
            guGuns = guGun_11
        } else if siDo_code == 26{
            guGuns = guGun_26
        } else if siDo_code == 27{
            guGuns = guGun_27
        } else if siDo_code == 28{
            guGuns = guGun_28
        } else if siDo_code == 29{
            guGuns = guGun_29
        } else if siDo_code == 30{
            guGuns = guGun_30
        } else if siDo_code == 31{
            guGuns = guGun_31
        } else if siDo_code == 36{
            guGuns = guGun_36
        } else if siDo_code == 41{
            guGuns = guGun_41
        } else if siDo_code == 42{
            guGuns = guGun_42
        } else if siDo_code == 43{
            guGuns = guGun_43
        } else if siDo_code == 44{
            guGuns = guGun_44
        } else if siDo_code == 45{
            guGuns = guGun_45
        } else if siDo_code == 46{
            guGuns = guGun_46
        } else if siDo_code == 47{
            guGuns = guGun_47
        } else if siDo_code == 48{
            guGuns = guGun_48
        } else if siDo_code == 50{
            guGuns = guGun_50
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadguGunCode()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Insert Local Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResult" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                guGun_code = guGuns[(indexPath?.row)!].code
                
                if let schoolAccidentTableViewController = segue.destination as? SchoolAccidentTableViewController{
                    schoolAccidentTableViewController.url =
                    "http://apis.data.go.kr/B552061/schoolzoneChild/getRestSchoolzoneChild?ServiceKey=Np4caedw1ZqP0urt6ekEv%2FkQnj4wQjHEEILFFnBA1i%2Fcv4c9m1KJDwwBpz6qYTT8B%2B0kzlcWMGrUmz1GiGELEg%3D%3D&searchYearCd=2017&siDo=" + String(siDo_code) + "&guGun=" + String(guGun_code) + "&type=xml&numOfRows=15&pageNo=1"
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredLocals.count
        }
        return guGuns.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SBNguGunCell", for: indexPath)

        let guGun: guGun
          if isFiltering() {
              guGun = filteredLocals[indexPath.row]
          }
          else {
              guGun = guGuns[indexPath.row]
          }
        cell.textLabel!.text = guGun.name
        return cell
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "ALL") {
        filteredLocals = guGuns.filter({( guGun : guGun ) -> Bool in
            return guGun.name!.contains(searchText)
        })
        
        tableView.reloadData()
    }
}

extension SearchByguGun: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

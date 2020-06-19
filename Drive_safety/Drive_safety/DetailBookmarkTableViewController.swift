//
//  DetailBookmarkTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/19.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class DetailBookmarkTableViewController: UITableViewController {

    let postsname : [String] = ["지점명", "발생건수", "사상자수", "사망자수", "중상자수", "경상자수", "부상신고자수"]
    var post : [String] = ["", "", "", "", "", "", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postsname.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBookmarkCell", for: indexPath)
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = post[indexPath.row]
        // Configure the cell...

        return cell
    }

}

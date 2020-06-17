//
//  siDoTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class siDoTableViewController: UITableViewController {
    
    var siDos:[siDo] = siDoCode
    
    var select_code:Int = 0
    var year: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToguGun" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                
                select_code = siDos[(indexPath?.row)!].code
                
                if let guGunTableViewController = segue.destination as? guGunTableViewController{
                    guGunTableViewController.siDo_code = select_code
                    guGunTableViewController.year = year
                }
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return siDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siDoCell", for: indexPath)

        let siDo_name = siDos[indexPath.row] as siDo
        cell.textLabel?.text = siDo_name.name
           
        return cell
    }

}

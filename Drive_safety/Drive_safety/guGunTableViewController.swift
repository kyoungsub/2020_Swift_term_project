//
//  guGunTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class guGunTableViewController: UITableViewController {

    var guGuns = [guGun]()
    var siDo_code:Int = 0
    var guGun_code:Int = 0
    
    func loadguGunCode(){
        if siDo_code == 11{
            guGuns = guGun_11
        } else if siDo_code == 26{
            guGuns = guGun_26
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToResult" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                guGun_code = guGuns[(indexPath?.row)!].code
                
                if let schoolAccidentTableViewController = segue.destination as? SchoolAccidentTableViewController{
                    schoolAccidentTableViewController.url =
                    "http://apis.data.go.kar/B552061/schoolzoneChild/getRestSchoolzoneChild?ServiceKey=Np4caedw1ZqP0urt6ekEv%2FkQnj4wQjHEEILFFnBA1i%2Fcv4c9m1KJDwwBpz6qYTT8B%2B0kzlcWMGrUmz1GiGELEg%3D%3D&searchYearCd=2015&siDo=" + String(siDo_code) + "&guGun=" + String(guGun_code) + "&type=xml&numOfRows=20&pageNo=1"
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return guGuns.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guGunCell", for: indexPath)

        let guGun_name = guGuns[indexPath.row] as guGun
        cell.textLabel?.text = guGun_name.name
           
        return cell
    }

}

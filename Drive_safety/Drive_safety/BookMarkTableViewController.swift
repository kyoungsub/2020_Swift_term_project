//
//  BookMarkTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/18.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class BookMarkTableViewController: UITableViewController {

    @IBOutlet var tbData: UITableView!
    
    var bookMarks:[Detail_info] = []
    var unique_check:Bool = true
    
    func decodedata() {
        let userDefaults = UserDefaults.standard
        let decoded = userDefaults.data(forKey: "bookmarks")
        let decodedBookmark = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Detail_info]
        
        bookMarks = decodedBookmark
    }
    
    override func viewWillAppear(_ animated: Bool) {
        decodedata()
        tbData.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguetoDetailbookmark" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
            
            if let detailBookmarkTableViewController = segue.destination as? DetailBookmarkTableViewController {
                detailBookmarkTableViewController.post[0] = bookMarks[indexPath!.row].spot_nm
                detailBookmarkTableViewController.post[1] = bookMarks[indexPath!.row].occrrnc_cnt
                detailBookmarkTableViewController.post[2] = bookMarks[indexPath!.row].caslt_cnt
                detailBookmarkTableViewController.post[3] = bookMarks[indexPath!.row].dth_dnv_cnt
                detailBookmarkTableViewController.post[4] = bookMarks[indexPath!.row].se_dnv_cnt
                detailBookmarkTableViewController.post[5] = bookMarks[indexPath!.row].sl_dnv_cnt
                detailBookmarkTableViewController.post[6] = bookMarks[indexPath!.row].wnd_dnv_cnt
                
                }
            }
        }
        else if segue.identifier == "segueToChart" {
            if let markedPlaceTotalResult_ViewController = segue.destination as?
                MarkedPlaceTotalResult_ViewController {
                markedPlaceTotalResult_ViewController.bookMarks = bookMarks
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookMarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)

        let spot_nm = bookMarks[indexPath.row].spot_nm
        cell.textLabel?.text = spot_nm
           
        return cell
    }

}

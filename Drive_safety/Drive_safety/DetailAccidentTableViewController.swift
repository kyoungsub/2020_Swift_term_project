//
//  DetailAccidentTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class DetailAccidentTableViewController: UITableViewController {

    @IBOutlet var detailTableView: UITableView!
    
    var unique_check:Bool = true
    
    @IBAction func Add_BookMark(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        let di = Detail_info(spot_nm: post[0], occrrnc_cnt: post[1], caslt_cnt: post[2], dth_dnv_cnt: post[3], se_dnv_cnt: post[4], sl_dnv_cnt: post[5], wnd_dnv_cnt: post[6])
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: di)
        userDefaults.set(encodedData, forKey: "bookmark")
        userDefaults.synchronize()
        
    }
    
    var index:Int = 0
    
    let postsname : [String] = ["지점명", "발생건수", "사상자수", "사망자수", "중상자수", "경상자수", "부상신고자수"]
    
    var posts = NSMutableArray()
    var post : [String] = ["", "", "", "", "", "", ""]
    var detail_infos:[Detail_info] = []
    
    var element = NSString()
    
    var spot_nm = NSMutableString()
    var occrrnc_cnt = NSMutableString()
    var caslt_cnt = NSMutableString()
    var dth_dnv_cnt = NSMutableString()
    var se_dnv_cnt = NSMutableString()
    var sl_dnv_cnt = NSMutableString()
    var wnd_dnv_cnt = NSMutableString()
    
    func loadInitialData() {
        for post in posts {
            let spot_nm = (post as AnyObject).value(forKey: "spot_nm") as! NSString as String
            let occrrnc_cnt = (post as AnyObject).value(forKey: "occrrnc_cnt") as! NSString as String
            let caslt_cnt = (post as AnyObject).value(forKey: "caslt_cnt") as! NSString as String
            let dth_dnv_cnt = (post as AnyObject).value(forKey: "dth_dnv_cnt") as! NSString as String
            let se_dnv_cnt = (post as AnyObject).value(forKey: "se_dnv_cnt") as! NSString as String
            let sl_dnv_cnt = (post as AnyObject).value(forKey: "sl_dnv_cnt") as! NSString as String
            let wnd_dnv_cnt = (post as AnyObject).value(forKey: "wnd_dnv_cnt") as! NSString as String
            
            let detail_info = Detail_info(spot_nm: spot_nm, occrrnc_cnt: occrrnc_cnt, caslt_cnt: caslt_cnt, dth_dnv_cnt: dth_dnv_cnt, se_dnv_cnt: se_dnv_cnt, sl_dnv_cnt: sl_dnv_cnt, wnd_dnv_cnt: wnd_dnv_cnt)
            detail_infos.append(detail_info)
        }
    }
    
    func put_data() {
        post[0] = detail_infos[index].spot_nm
        post[1] = detail_infos[index].occrrnc_cnt
        post[2] = detail_infos[index].caslt_cnt
        post[3] = detail_infos[index].dth_dnv_cnt
        post[4] = detail_infos[index].se_dnv_cnt
        post[5] = detail_infos[index].sl_dnv_cnt
        post[6] = detail_infos[index].wnd_dnv_cnt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
        put_data()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = post[indexPath.row]
        // Configure the cell...

        return cell
    }

}

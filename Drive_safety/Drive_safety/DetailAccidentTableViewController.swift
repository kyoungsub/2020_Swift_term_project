//
//  DetailAccidentTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class DetailAccidentTableViewController: UITableViewController, XMLParserDelegate {

    @IBOutlet var detailTableView: UITableView!
    
    var url: String?
    
    var spotcode: String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["지점명", "발생건수", "사상자수", "사망자수", "중상자수", "경상자수", "부상신고자수"]
    
    var posts : [String] = ["", "", "", "", "", "", ""]
    
    var element = NSString()
    
    var spot_nm = NSMutableString()
    var occrrnc_cnt = NSMutableString()
    var caslt_cnt = NSMutableString()
    var dth_dnv_cnt = NSMutableString()
    var se_dnv_cnt = NSMutableString()
    var sl_dnv_cnt = NSMutableString()
    var wnd_dnv_cnt = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        detailTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            posts = ["","","","","","",""]
            
            spot_nm = NSMutableString()
            spot_nm = ""
            occrrnc_cnt = NSMutableString()
            occrrnc_cnt = ""
            
            caslt_cnt = NSMutableString()
            caslt_cnt = ""
            dth_dnv_cnt = NSMutableString()
            dth_dnv_cnt = ""
            se_dnv_cnt = NSMutableString()
            se_dnv_cnt = ""
            sl_dnv_cnt = NSMutableString()
            sl_dnv_cnt = ""
            wnd_dnv_cnt = NSMutableString()
            wnd_dnv_cnt = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "spot_nm") {
            spot_nm.append(string)
        } else if element.isEqual(to: "occrrnc_cnt") {
            occrrnc_cnt.append(string)
        } else if element.isEqual(to: "caslt_cnt") {
            caslt_cnt.append(string)
        } else if element.isEqual(to: "dth_dnv_cnt") {
            dth_dnv_cnt.append(string)
        } else if element.isEqual(to: "se_dnv_cnt") {
            se_dnv_cnt.append(string)
        } else if element.isEqual(to: "sl_dnv_cnt") {
            sl_dnv_cnt.append(string)
        } else if element.isEqual(to: "wnd_dnv_cnt") {
            wnd_dnv_cnt.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item") {
            if !spot_nm.isEqual(nil) {
                posts[0] = spot_nm as String
            }
            if !occrrnc_cnt.isEqual(nil) {
                posts[1] = occrrnc_cnt as String
            }
            if !caslt_cnt.isEqual(nil) {
                posts[2] = caslt_cnt as String
            }
            if !dth_dnv_cnt.isEqual(nil) {
                posts[3] = dth_dnv_cnt as String
            }
            if !se_dnv_cnt.isEqual(nil) {
                posts[4] = se_dnv_cnt as String
            }
            if !sl_dnv_cnt.isEqual(nil) {
                posts[5] = sl_dnv_cnt as String
            }
            if !wnd_dnv_cnt.isEqual(nil) {
                posts[6] = wnd_dnv_cnt as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        beginParsing()
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
        cell.detailTextLabel?.text = posts[indexPath.row]
        // Configure the cell...

        return cell
    }

}

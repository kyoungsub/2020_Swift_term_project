//
//  SchoolAccidentTableViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/11.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class SchoolAccidentTableViewController: UITableViewController, XMLParserDelegate {
    @IBOutlet var resultTableView: UITableView!
    
    var url : String?
    var parser = XMLParser()
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var sido_sgg_nm = NSMutableString()
    var occrrnc_cnt = NSMutableString()
    
    var XPos = NSMutableString()
    var YPos = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        resultTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "frequentzone")
        {
            elements = NSMutableDictionary()
            elements = [:]
            sido_sgg_nm = NSMutableString()
            sido_sgg_nm = ""
            occrrnc_cnt = NSMutableString()
            occrrnc_cnt = ""
            
            XPos = NSMutableString()
            XPos = ""
            YPos = NSMutableString()
            YPos = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "sido_sgg_nm") {
            sido_sgg_nm.append(string)
        }
        else if element.isEqual(to: "occrrnc_cnt") {
            occrrnc_cnt.append(string)
        }
        else if element.isEqual(to: "lo_crd") {
            XPos.append(string)
        }
        else if element.isEqual(to: "la_crd") {
            YPos.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "frequentzone") {
            if !sido_sgg_nm.isEqual(nil) {
                elements.setObject(sido_sgg_nm, forKey: "sido_sgg_nm" as NSCopying)
            }
            if !occrrnc_cnt.isEqual(nil) {
                elements.setObject(occrrnc_cnt, forKey: "occrrnc_cnt" as NSCopying)
            }
            if !XPos.isEqual(nil) {
                elements.setObject(XPos, forKey: "lo_crd" as NSCopying)
            }
            if !YPos.isEqual(nil) {
                elements.setObject(YPos, forKey: "la_crd" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        beginParsing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)

        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"sido_sgg_nm") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"occrrnc_cnt")as! NSString as String
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Drive_safety
//
//  Created by Game on 2020/06/07.
//  Copyright © 2020 Game. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbData: UITableView!
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var local = NSMutableString()
    var numOFAccident = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:"http://apis.data.go.kr/B552061/schoolzoneChild/getRestSchoolzoneChild?ServiceKey=Np4caedw1ZqP0urt6ekEv%2FkQnj4wQjHEEILFFnBA1i%2Fcv4c9m1KJDwwBpz6qYTT8B%2B0kzlcWMGrUmz1GiGELEg%3D%3D&searchYearCd=2019&siDo=11&numOfRows=10&pageNo=1"))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "frequentzone")
        {
            elements = NSMutableDictionary()
            elements = [:]
            local = NSMutableString()
            local = ""
            numOFAccident = NSMutableString()
            numOFAccident = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "sido_sgg_nm") {
            local.append(string)
        }
        else if element.isEqual(to: "occrrnc_cnt") {
            numOFAccident.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "frequentzone") {
            if !local.isEqual(nil) {
                elements.setObject(local, forKey: "sido_sgg_nm" as NSCopying)
            }
            if !numOFAccident.isEqual(nil) {
                elements.setObject(numOFAccident, forKey: "occrrnc_cnt" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "sido_sgg_nm") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "occrrnc_cnt") as! NSString as String
        return cell
    }
}


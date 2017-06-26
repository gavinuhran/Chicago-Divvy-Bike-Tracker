//
//  ViewController.swift
//  divvyBike
//
//  Created by Gavin Uhran on 6/26/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!

    
    var stations = [[String: String]]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let urlString = "https://feeds.divvybikes.com/stations/stations.json"
        if let url = URL(string: urlString) //if statement checks to see if the url if valid
        {
            if let myData = try? Data(contentsOf: url, options: []) //returns data objects and checks for error
            {
                let json = JSON(myData)
                print(json["stationBeanList"]["id"].stringValue)
                parse(myData: json)
            }
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let station = stations[indexPath.row]
        cell.textLabel?.text = station["location"]
        cell.detailTextLabel?.text = station["dock"]
        return cell
    }
    func parse(myData: JSON)
    {
        for elements in myData["results"].arrayValue
        {
            let title = elements["title"].stringValue
            let id = elements["id"].stringValue
            let body = elements["body"].stringValue
            
            let obj = ["title": title, "id": id, "body": body]
            stations.append(obj)
        }
        myTableView.reloadData()
        
    }
}


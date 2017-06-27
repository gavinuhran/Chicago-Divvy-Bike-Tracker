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
        cell.textLabel?.text = station["stationName"]!
        cell.detailTextLabel?.text = station["availableDocks"]! + " of the " + station["totalDocks"]! + " docks are open"
        return cell
    }
    
    func parse(myData: JSON)
    {
        for elements in myData["stationBeanList"].arrayValue
        {
            let stationName = elements["stationName"].stringValue
            let totalDocks = elements["totalDocks"].stringValue
            let availableDocks = elements["availableDocks"].stringValue
            let latitude = elements["latitude"].stringValue
            let longitude = elements["longitude"].stringValue
            let obj = ["stationName": stationName, "availableDocks": availableDocks, "totalDocks": totalDocks, "latitude": latitude, "longitude": longitude]
            stations.append(obj)
        }
        myTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "detailView"
        {
        let station = stations[(myTableView.indexPathForSelectedRow?.row)!]
        let dvc = segue.destination as! DetailViewController
        dvc.detailItem = station
        }
        
        if segue.identifier == "mapView"
        {
           
            let mvc = segue.destination as! MapViewController
            mvc.stationsArray = stations
           
        }
    }
}




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
}


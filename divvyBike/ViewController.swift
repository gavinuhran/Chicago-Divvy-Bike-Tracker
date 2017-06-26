//
//  ViewController.swift
//  divvyBike
//
//  Created by Gavin Uhran on 6/26/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var myTableView: UITableView!

    
    var petition = [[String: String]]()
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        let urlString = "https://feeds.divvybikes.com/stations/stations.json"
        
        
       
    }

    
   


}


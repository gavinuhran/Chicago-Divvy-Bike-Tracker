//
//  DetailViewController.swift
//  divvyBike
//
//  Created by Ronak Chaudhuri on 6/26/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class DetailViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{

    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var myMapView: MKMapView!
    
    var detailItem:[String: String]!
    let locationManager = CLLocationManager()
    var coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    
    override func viewDidLoad()
    {
        coordinate = CLLocationCoordinate2DMake(Double(detailItem["latitude"]!)!, Double(detailItem["longitude"]!)!)
        super.viewDidLoad()
        locationManager.delegate = self
        myMapView.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        myMapView.showsUserLocation = true
        myMapView.userLocation.title = "My Location"
        
        myTextView.text = detailItem["stationName"]! + "\n" + "\n" + "There are " + detailItem["availableDocks"]! + " docks available out of " + detailItem["totalDocks"]! + " docks!"
    }

    func locationManager( manager: CLLocationManager, didUpdateLocations location: [CLLocation])
    {
        print(locationManager.location)
    }
    

  

}

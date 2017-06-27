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
    var stationsArray = [[String:String]]()
    
    
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
        
        setCenterofMapToLocation(location: coordinate)
        addPinAnnotationToMapView(location: coordinate)
    }

    func locationManager( manager: CLLocationManager, didUpdateLocations location: [CLLocation])
    {
        print(locationManager.location)
    }
    func addPinAnnotationToMapView(location: CLLocationCoordinate2D)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        myMapView.addAnnotation(annotation)
       
    }
    func setCenterofMapToLocation(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let reigon = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(reigon, animated: true)
        
    }
   

}

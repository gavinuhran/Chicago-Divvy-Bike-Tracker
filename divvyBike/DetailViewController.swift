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
   
   
    var detailItems:[String: String]!
    let locationManager = CLLocationManager()
    var coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    
    
    
    override func viewDidLoad()
    {
        coordinate = CLLocationCoordinate2DMake(Double(detailItems["latitude"]!)!, Double(detailItems["longitude"]!)!)
        super.viewDidLoad()
        locationManager.delegate = self
        myMapView.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        myMapView.showsUserLocation = true
        myMapView.userLocation.title = "My Location"
   
        
        myTextView.text = detailItems["stationName"]! + "\n" + "\n" + "There are " + detailItems["availableDocks"]! + " docks available out of " + detailItems["totalDocks"]! + " docks!"
        
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
        annotation.title = detailItems["stationName"]
        annotation.subtitle = detailItems["city"]
       
    }
    func setCenterofMapToLocation(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let reigon = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(reigon, animated: true)
        
    }
   

}

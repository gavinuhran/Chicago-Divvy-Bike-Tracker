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
    @IBOutlet weak var myMapView2: MKMapView!
   
    var detailItem:[String: String]!
    let locationManager = CLLocationManager()
    var coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    var stationsArray = [[String:String]]()
    
    
    override func viewDidLoad()
    {
      //  coordinate = CLLocationCoordinate2DMake(Double(detailItem["latitude"]!)!, Double(detailItem["longitude"]!)!)
        super.viewDidLoad()
        locationManager.delegate = self
        myMapView.delegate = self
        myMapView2.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        myMapView.showsUserLocation = true
        myMapView.userLocation.title = "My Location"
        myMapView2.showsUserLocation = true
        myMapView2.userLocation.title = "My Location"
        
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
        myMapView2.addAnnotation(annotation)
    }
    func setCenterofMapToLocation(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let reigon = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(reigon, animated: true)
        myMapView2.setRegion(reigon, animated: true)
    }
    func mapParse(myData: JSON)
    {
       for elements in myData["stationBeanList"].arrayValue
       {
        let latitude1 = elements["latitude"].stringValue
        let longitude1 = elements["longitude"].stringValue
        let obj1 = ["latitude": latitude1, "longitude": longitude1]
        stationsArray.append(obj1)
        }
    }

}

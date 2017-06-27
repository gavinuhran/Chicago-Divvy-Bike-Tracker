//
//  MapViewController.swift
//  divvyBike
//
//  Created by Gavin Uhran on 6/27/17.
//  Copyright © 2017 Gavin Uhran. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    
    @IBOutlet weak var myMapView2: MKMapView!
    
    let locationManager = CLLocationManager()
    var coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    var stationsArray = [[String:String]]()
    
    
    override func viewDidLoad()
    {        super.viewDidLoad()

        for station in stationsArray
        {
        coordinate = CLLocationCoordinate2DMake(Double(station["latitude"]!)!, Double(station["longitude"]!)!)
            
        }
        
        locationManager.delegate = self
        
        myMapView2.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
      
        myMapView2.showsUserLocation = true
        myMapView2.userLocation.title = "My Location"
        
        
        
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
        
        myMapView2.addAnnotation(annotation)
    }
    func setCenterofMapToLocation(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let reigon = MKCoordinateRegion(center: location, span: span)
 
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

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
    
    var detailItem1:[String: String]!
    let locationManager1 = CLLocationManager()
    var coordinate1 = CLLocationCoordinate2DMake(0.0, 0.0)
    var stationsArray = [[String:String]]()
    
    
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
           coordinate1 = CLLocationCoordinate2DMake(Double(detailItem1["latitude"]!)!, Double(detailItem1["longitude"]!)!)
        locationManager1.delegate = self
        
        myMapView2.delegate = self
        locationManager1.requestAlwaysAuthorization()
        locationManager1.startUpdatingLocation()
        
        
      
        myMapView2.showsUserLocation = true
        myMapView2.userLocation.title = "My Location"
        
        
        
        setCenterofMapToLocation(location: coordinate1)
        addPinAnnotationToMapView(location: coordinate1)
    }
    func locationManager( manager: CLLocationManager, didUpdateLocations location: [CLLocation])
    {
        print(locationManager1.location)
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

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

class MapViewController: UIViewController, CLLocationManagerDelegate
{
    var detailItems: [[String: String]] = []
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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        for items in detailItems
        {
      
            print("latitude:" + items["latitude"]!)
            var centerLocation = CLLocationCoordinate2DMake(Double(items["latitude"]!)!,Double(items["longitude"]!)!)
            var mapSpan = MKCoordinateSpanMake(0.08, 0.08)
            var mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
            let annotation = MKPointAnnotation()
            annotation.coordinate = centerLocation
            myMapView2.addAnnotation(annotation)
            annotation.title = items["stationName"]
            annotation.subtitle = items["city"]
        }
        
       


}
    
    
    
}

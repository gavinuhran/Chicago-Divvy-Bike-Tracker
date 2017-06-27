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
    
    let manager = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        myMapView2.setRegion(region, animated: true)
        self.myMapView2.showsUserLocation = true
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

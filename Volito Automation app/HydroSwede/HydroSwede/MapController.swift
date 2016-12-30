//
//  MapController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2016-12-30.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 5000000
    var first = true
    //var initialLocation = CLLocation()
    
    let locationManager = CLLocationManager()
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue = locations.first {
            print("Found user's location: \(locValue)")
            if(first == true){
                centerMapOnLocation(location: CLLocation(latitude: locValue.coordinate.latitude, longitude: locValue.coordinate.longitude))
                first = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        let ornskoldsvik = Stores(title: "Hydsupply", locationName: "Örnsköldsvik", number: "0660 - 266 490", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 63.2900474, longitude: 18.7166166))
        mapView.addAnnotation(ornskoldsvik)
        
        //print("locations = \(initialLocation.coordinate.latitude) \(initialLocation.coordinate.longitude)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

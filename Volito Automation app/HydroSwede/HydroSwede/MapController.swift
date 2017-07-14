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
    var regionRadius: CLLocationDistance = 2128000.0
    var first = true
    let ornskoldsvik = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Kavelvägen 14\n894 35 SJÄLEVAD", number: "0660-266-490", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 63.28636290000001, longitude: 18.59827310000003))
    let borlange = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Maskingränd 4\n781 72 BORLÄNGE", number: "0243-81-222", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 60.4673689, longitude: 15.456168899999966))
    let kiruna = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Fasadvägen 24\n981 41 Kiruna", number: "+46-761-400-566", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 67.840614, longitude: 20.33741))
    let skelleftea = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Gymnasievägen 16\n931 57 SKELLEFTEÅ", number: "0910-725-580", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 64.7346985, longitude: 20.97330039999997))
    let smalandsstenar = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Skruvgatan 9\n333 24 SMÅLANDSSTENAR", number: "0371-523-850", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 57.1500229, longitude: 13.385861900000009))
    let stockholm = Stores(title: "Hydraulic Supplier i Norden AB", locationName: "Fågelviksvägen 18\n145 53 Norsborg", number: "076-1400-560", email: "kundtjanst@hydsupply.se", coordinate: CLLocationCoordinate2D(latitude: 59.25587600000001, longitude: 17.86953970000002))
    let vetlanda = Stores(title: "HINDAB - Hydraulik & Industriservice AB", locationName: "Brogårdsgatan 1\n574 23 Vetlanda", number: "0383-101-25", email: "v@hindab.se", coordinate: CLLocationCoordinate2D(latitude: 57.4193712, longitude: 15.0828084))
    let nassjo = Stores(title: "HINDAB - Hydraulik & Industriservice AB", locationName: "Kapvägen 1\n571 34 Nässjö", number: "0380-184-00", email: "n@hindab.se", coordinate: CLLocationCoordinate2D(latitude: 57.6680467, longitude: 14.6899695))
    let tranas = Stores(title: "HINDAB - Hydraulik & Industriservice AB", locationName: "Västra Vägen 27\n573 41 Tranås", number: "0140-161-56", email: "t@hindab.se", coordinate: CLLocationCoordinate2D(latitude: 58.0375976, longitude: 14.9713439))
    //var initialLocation = CLLocation()
    
    var annos = [Stores]()
    
    let locationManager = CLLocationManager()
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.1, regionRadius * 2.1)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locValue = locations.first {
            print("Found user's location: \(locValue)")
            if(first == true){
                var centerLocation = CLLocation()
                for object in annos {
                    let locationTwo = CLLocation(latitude: object.coordinate.latitude, longitude: object.coordinate.longitude)
                    if(locValue.distance(from: locationTwo) < regionRadius){
                        regionRadius = locValue.distance(from: locationTwo)
                        centerLocation = locationTwo
                    }
                }
                centerMapOnLocation(location: CLLocation(latitude: centerLocation.coordinate.latitude, longitude: centerLocation.coordinate.longitude))
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
        annos.append(ornskoldsvik)
        annos.append(borlange)
        annos.append(kiruna)
        annos.append(skelleftea)
        annos.append(smalandsstenar)
        annos.append(stockholm)
        annos.append(vetlanda)
        annos.append(nassjo)
        annos.append(tranas)
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        for object in annos {
            mapView.addAnnotation(object)
        }
        
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

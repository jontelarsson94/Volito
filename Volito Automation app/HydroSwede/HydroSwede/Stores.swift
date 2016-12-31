//
//  Stores.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2016-12-30.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import MapKit
import AddressBook

class Stores: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let number: String
    let email: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, number: String, email: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.number = number
        self.email = email
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    func mapItem() -> MKMapItem {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}


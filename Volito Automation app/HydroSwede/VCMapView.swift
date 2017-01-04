//
//  VCMapView.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2016-12-30.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import Foundation

import MapKit

extension MapController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Stores {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            if #available(iOS 9.0, *) {
                let subtitleView = UILabel()
                subtitleView.font = subtitleView.font.withSize(12)
                subtitleView.numberOfLines = 0
                subtitleView.text = "\(annotation.subtitle!)"
                view.detailCalloutAccessoryView = subtitleView
            }
            
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Stores
        let annotation = view.annotation as! Stores
        let alert = UIAlertController(title: "Choose an option", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Call store", style: .default, handler: { action in
            switch action.style{
            case .default:
                let number = annotation.number
                print(number)
                let url = NSURL(string: "tel://\(number)")
                UIApplication.shared.openURL(url as! URL)
                
                //This is for presenting email segue
                /*let next = self.storyboard?.instantiateViewController(withIdentifier: "EmailController") as? EmailController
                 //next.ip = ipAddressField.text
                 //next.username = usernameField.text
                 //next.password = passwordField.text
                 self.present(next!, animated: true, completion: nil)*/
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Email store", style: .default, handler: { action in
            switch action.style{
            case .default:
                
                let email = annotation.email
                let url = NSURL(string: "mailto:\(email)")
                UIApplication.shared.openURL(url as! URL)
                
                //This is for presenting email segue
                /*let next = self.storyboard?.instantiateViewController(withIdentifier: "EmailController") as? EmailController
                //next.ip = ipAddressField.text
                //next.username = usernameField.text
                //next.password = passwordField.text
                self.present(next!, animated: true, completion: nil)*/
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Get driving instructions", style: .default, handler: { action in
            switch action.style{
            case .default:
                let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                location.mapItem().openInMaps(launchOptions: launchOptions)
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            switch action.style{
            case .default:
                alert.dismiss(animated: true, completion: nil)
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  Finding The User Location
//
//  Created by Rob Percival on 20/06/2016.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        CLGeocoder().reverseGeocodeLocation(userLocation){(placemarks, error) in
        
            if error != nil{
                print(error)
            } else{
               
                if let placemark = placemarks?[0]{
                    
                    var subThroughFare = ""
                    
                    if placemark.subThoroughfare != nil {
                        
                        subThroughFare = placemark.subThoroughfare!
                    }
                    
                    var throughFare = ""
                    
                    if placemark.thoroughfare != nil{
        
                        throughFare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil{
                        
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrativeArea = ""
                    
                    if placemark.subAdministrativeArea != nil{
                        
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil{
                        
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil{
                        
                        country = placemark.country!
                    }
                    
                    print(subThroughFare + throughFare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                    
                }
            }
        }
    }
}


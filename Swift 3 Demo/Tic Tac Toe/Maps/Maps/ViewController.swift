//
//  ViewController.swift
//  Maps
//
//  Created by Sergio Díaz Navarro on 12/15/16.
//  Copyright © 2016 Sergio Díaz Navarro. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let latitude: CLLocationDegrees = 27.175244
        let longitude: CLLocationDegrees = 28.0399773
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude:longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        annotation.subtitle = "I will go here"
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        let uiLongPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestionRecognizer:)))
        
        uiLongPress.minimumPressDuration = 2
    
        
        
        map.addGestureRecognizer(uiLongPress)
        
    
    }
    
    
    func longpress(gestionRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestionRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "Subtitle"
        
        map.addAnnotation(annotation)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


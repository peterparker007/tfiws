//
//  Artwork.swift
//  HonoluluArtMapDemo
//
//  Created by Andrew on 2016/12/15.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import MapKit
import AddressBook
import  Contacts

class Artwork: NSObject ,MKAnnotation {
    public var title: String?
    
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    public var subtitle: String? {
        return locationName
    }
    
    func pinColor() -> UIColor  {
        switch discipline {
        case "Sculpture", "Plaque":
            return UIColor.red
        case "Mural", "Monument":
            return UIColor.purple
        default:
            return UIColor.green
        }
    }
    
    class func fromJSON(json: [JSONValue]) -> Artwork? {
        // 1
        var title: String
        if let titleOrNil = json[16].string {
            title = titleOrNil
        } else {
            title = ""
        }
        let locationName = json[12].string
        let discipline = json[15].string
        
        // 2
        let latitude = (json[18].string! as NSString).doubleValue
        let longitude = (json[19].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // 3
        return Artwork(title: title, locationName: locationName!, discipline: discipline!, coordinate: coordinate)
    }
    
    // annotation callout opens this mapItem in Maps app
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}

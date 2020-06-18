//
//  Spot.swift
//  Drive_safety
//
//  Created by Game on 2020/06/18.
//  Copyright © 2020 Game. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Spot: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    func mapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = title
        return mapItem
    }
}

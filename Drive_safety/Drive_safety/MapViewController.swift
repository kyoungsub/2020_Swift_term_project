//
//  MapViewController.swift
//  HospitalMap
//
//  Created by kpugame on 2020/05/19.
//  Copyright © 2020 DONGYEOP KIM. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var posts = NSMutableArray()
    var initla_ord: Double = 0
    var initlo_ord: Double = 0
    
    let regionRadius: CLLocationDistance = 5000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    var spots: [Spot] = []
    
    func loadInitialData() {
        for post in posts {
            let spot_nm = (post as AnyObject).value(forKey: "spot_nm") as! NSString as String
            
            let XPos = (post as AnyObject).value(forKey: "lo_crd") as! NSString as String
            let YPos = (post as AnyObject).value(forKey: "la_crd") as! NSString as String
            let lat = (YPos as NSString).doubleValue
            let lon = (XPos as NSString).doubleValue
            let spot = Spot(title: spot_nm, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            initla_ord = lat
            initlo_ord = lon
            spots.append(spot)
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Spot
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
    func mapView(_  mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let annotation = annotation as? Spot else { return nil }
    
    let identifier = "marker"
    var view: MKMarkerAnnotationView
    
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
        dequeuedView.annotation = annotation
        view = dequeuedView
    }
    else {
        view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadInitialData()
        
        let initialLocation = CLLocation(latitude: initla_ord, longitude: initlo_ord)
        
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        mapView.addAnnotations(spots)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

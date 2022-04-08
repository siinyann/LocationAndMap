//
//  ViewController.swift
//  LocationAndMap
//
//  Created by Swift on 21/3/22.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var lm : CLLocationManager?
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lm = CLLocationManager()
        lm?.delegate = self
        lm?.desiredAccuracy = kCLLocationAccuracyBest
        lm?.distanceFilter = 0
        lm?.requestWhenInUseAuthorization()
        
        lm?.startUpdatingLocation()
        
        var point = MKPointAnnotation()
        point.title = "Yio Chu Kang Station"
        point.coordinate = CLLocationCoordinate2D(latitude: 1.3817, longitude: 103.8449)
        mapView.addAnnotation(point)
        
        point = MKPointAnnotation()
        point.title = "Ang Mo Kio Station"
        point.coordinate = CLLocationCoordinate2D(latitude: 1.3700, longitude: 103.8496)
        mapView.addAnnotation(point)
        
        point = MKPointAnnotation()
        point.title = "Bishan Station"
        point.coordinate = CLLocationCoordinate2D(latitude: 1.3508, longitude: 103.8482)
        mapView.addAnnotation(point)

        point = MKPointAnnotation()
        point.title = "Khatib Station"
        point.coordinate = CLLocationCoordinate2D(latitude: 1.4173, longitude: 103.8330)
        mapView.addAnnotation(point)
        
        mapView.delegate = self

        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        var location = locations.last!
        
        print("\(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        // Follow the user's position by centralizing the map to him or her.
        //
        var region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 3000,
            longitudinalMeters: 3000)
        mapView.setRegion(region, animated: true)
    }
    
    // This allows you to change how the annotations look to the user.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation
        {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation")
        
        if annotationView == nil
        {
            var pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
            annotationView = pinAnnotationView
        }
        
        annotationView?.annotation = annotation
        
        annotationView?.canShowCallout = true
        return annotationView
    }

}


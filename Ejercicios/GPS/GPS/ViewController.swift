//
//  ViewController.swift
//  GPS
//
//  Created by d182_Sergio_A on 25/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    let initialLocation = CLLocation(latitude: 37.7843, longitude: -122.4007)
    let regionRadius: CLLocationDistance = 50000
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        startReceivingLocationChanges()
        enableBasicLocationServices()
        centerMapOnLocation(location: initialLocation)
        addLocations()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func  addLocations() {
        let yodaBar = BarAnnotation(title: "ILM", locationName: "ILM visitor", theme: "Star Wars", coordinate: CLLocationCoordinate2D(latitude: 37.798894, longitude: -122.4508267))
        mapView.addAnnotation(yodaBar)
    }

}

extension  ViewController: MKMapViewDelegate{
    
}

extension ViewController:CLLocationManagerDelegate{
    func enableBasicLocationServices() {
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                // Request when-in-use authorization initially
                locationManager.requestWhenInUseAuthorization()
                enableBasicLocationServices()
                break
            
            case .restricted, .denied:
                // Disable location features
                disableMyLocationBasedFeatures()
                break
            
            case .authorizedWhenInUse,.authorizedAlways:
                // Enable basic location features
                enableMyWhenInUseFeatures()
                break
        }
    }
    func disableMyLocationBasedFeatures(){
        print("Disable location Service")
        _ = checkForLocationServices()
    }
    func enableMyWhenInUseFeatures() {
        print("Enable location service...")
        guard checkForLocationServices() else { return }
    }
    
    func checkForLocationServices() -> Bool{
        if CLLocationManager.locationServicesEnabled() {
            print("Location services are available, so query the user’s location.")
            return true
        } else {
            print("Update your app’s UI to show that the location is unavailable.")
            return false
        }
    }
    
    func startReceivingLocationChanges() {
        //locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 1.0  // In meters.
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("ALTL:\(location.altitude) LON: \(location.coordinate.longitude) LAT:\(location.coordinate.latitude)")
    }
    
}

//
//  ViewController.swift
//  InClassLocation
//
//  Created by zweakland on 4/22/21.
//

// allows us to add the proper
// resources for getting location
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{

    // @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    // object to start, stop, and configure out location
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // a delegate allows the object to be notified
        // when something important happens to it
        // location changed, user allowed/denied permission, etc
        
        // all delegate methods are within this class
        locationManager.delegate = self
        // how accurate the user location is
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // asks the user's for permission to use
        // the location when the app is in use
        locationManager.requestWhenInUseAuthorization()
        // starts updating the location
        locationManager.startUpdatingLocation()
        // shows the user's current location
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // trying to grab location if it exists
        // user could have denied permission so in this case
        // myLocation would be empty or nil
        guard let myLocation = locations.last else {
            return
        }
        
        // grab user's coordinate
        let coordinate = CLLocationCoordinate2D(latitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude)
        
        // zoom level used by the map view object
        let zoom = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // region stores the user's coordinates & zoom level
        let region = MKCoordinateRegion(center: coordinate, span: zoom)
        
        mapView.setRegion(region, animated: true)
//        locationLabel.text = "\(myLocation.coordinate.longitude) | \(myLocation.coordinate.latitude)"
        
    }
    
    
    

}


//
//  BirdMapController.swift
//  EagleEye
//
//  Created by Greg Sharp on 11/15/22.
//

import UIKit
import MapKit

class BirdMapController: UIViewController {
 
    @IBOutlet var mapView: MKMapView!
    
    var bird: Bird! {
        didSet {
            navigationItem.title = bird.comName
        }
    }
    var store: BirdStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let location = CLLocationCoordinate2D(latitude: bird.lat, longitude: bird.lng)
        let region = MKCoordinateRegion( center: location, latitudinalMeters: CLLocationDistance(exactly: 1500)!, longitudinalMeters: CLLocationDistance(exactly: 1500)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        
        
    }
}

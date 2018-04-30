//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Alex Rasho on 2/7/18.
//  Copyright © 2018 Alex Rasho. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController : UIViewController, MKMapViewDelegate {
    var mapView : MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        mapView = MKMapView()
        locationManager = CLLocationManager() //declare location manager
        view = mapView
        self.title = NSLocalizedString("mapText", comment: "")
        let sc = UISegmentedControl(items: [NSLocalizedString("stanText", comment: ""), NSLocalizedString("hybText", comment: ""), NSLocalizedString("satText", comment: "")]) //Create a segmentedControl
        sc.backgroundColor = UIColor.white.withAlphaComponent(0.5) //background color, it will be transparent when lower.
        sc.selectedSegmentIndex = 0 //Which one is selected on the segmented controller when opening
        sc.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)),
                     for: .valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sc)
        
    
        let margins = view.layoutMarginsGuide
        let topConstraint = sc.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = sc.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = sc.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
//       let locationButton = UIButton() //Location Button
//        locationButton.setTitle("Fine Me", for: .normal)
//        locationButton.backgroundColor = UIColor.white.withAlphaComponent(0.5)
//        locationButton.frame = CGRect(30, 70, 80, 30)
//        locationButton.addTarget(self, action: #selector(MapViewController.FindLocation(_:)), for: view.addSubview(locationButton))
//
//        func showLocalization(sender: UIButton!) {
//            locationManager.requestWhenInUseAuthorization()
//            self.mapView(mapView, didUpdate: location)
//        }
        
        
        
        
}
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex{
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("MapViewController's view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("MapViewController's view did appear...")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        print("MapViewController's view will disappear...");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        print("MapViewController's view did disappear...");
    }
}

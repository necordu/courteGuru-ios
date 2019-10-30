//
//  CGMapViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 28/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class CGMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    @IBOutlet var segmentView: UISegmentedControl!
    @IBOutlet var mallTable: UITableView!
    
    var viewModel: CGMallViewModel? {
        didSet {
            fillUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CGMallViewModelIn()
        // Do any additional setup after loading the view.
    }
     
    func fillUI() {
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!,
        longitude: (location?.coordinate.longitude)!,
        zoom: 6.0)
        
            
        mapView.camera = camera
        mapView.animate(to: camera)
     
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

//
//  ViewController.swift
//  GooglePlayground
//
//  Created by Jared Warren on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    
    @IBOutlet weak var utahCountyMapView: GMSMapView!
//    var queriedLocation: CLLocationCoordinate2D
//    private let searchRadius: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        setBorderAroundUtahCounty()
        addMarkers()
    }
    
    func setupMap() {
        
        utahCountyMapView.delegate = self
        utahCountyMapView.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: 40.0966, longitude: -111.5707), zoom: 10, bearing: 0, viewingAngle: 0)
        
    }
    
    func addMarkers() {
        

        GoogleNetworkController.fetchNearbyComplexes { (locations) in
            
            DispatchQueue.main.async {
            for location in locations {
                    let newMarker = ApartmentComplexMarker(apartmentLocation: location)
                    newMarker.map = self.utahCountyMapView
                }
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        // TODO: Implement action on didTapInfoWindow OR didTap marker.
    }
    
    func setBorderAroundUtahCounty() {
        
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 39.897824, longitude: -110.081725))
        path.add(CLLocationCoordinate2D(latitude: 39.897824, longitude: -110.856506))
        path.add(CLLocationCoordinate2D(latitude: 39.811903, longitude: -110.856506))
        
        let utahCounty = GMSPolyline(path: path)
        utahCounty.strokeColor = UIColor.red
        utahCounty.strokeWidth = 2
        utahCounty.map = self.utahCountyMapView
    }
}

// TODO: Method that takes in a city and returns a CLLocationCoordinate2D in order to position camera.

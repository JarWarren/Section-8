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


// TODO: Implement marker clustering -> github.com/googlemaps/google-maps-ios-utils
class MapViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var callButton: UIButton!
    var locations: [ApartmentLocation]?
    
    @IBOutlet weak var utahCountyMapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        addMarkers()
        utahCountyMapView.delegate = self
    }
    
    // MARK: - Setup Methods
    func setupMap() {
        
        utahCountyMapView.delegate = self
        utahCountyMapView.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: 40.0966, longitude: -111.5707), zoom: 11, bearing: 0, viewingAngle: 0)
        
    }
    
    func addMarkers() {
        

        GoogleNetworkController.fetchNearbyComplexes { (locations) in
            
            self.locations = locations
            DispatchQueue.main.async {
            for location in locations {
                    let newMarker = ApartmentComplexMarker(apartmentLocation: location)
                    newMarker.map = self.utahCountyMapView
                }
            }
        }
    }
    
    func setupCustomView() {
        
        //TODO: Create a reusable custom view that contains name, address, phone and photo.
    }
        //TODO: Method that takes in a city and returns a CLLocationCoordinate2D in order to position camera.
    
    // MARK: - Data Source Methods
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    
        guard let locations = locations else { return false }
        for location in locations {
            if location.geometry.location.lat == marker.position.latitude && location.geometry.location.lng == marker.position.longitude {
                GoogleNetworkController.fetchPlaceDetails(placeID: location.place_id) { (name, phone, address) in
                    DispatchQueue.main.async {
                        marker.tracksInfoWindowChanges = true
                        marker.title = name
                        marker.snippet = "\(phone)\n\(address)"
                    }
                }
            }
        }
        return true
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        
        // Called when a marker is about to become selected, and provides an optional custom info window to use for that marker if this method returns a UIView.
        return UIView()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        
        // Called when mapView:markerInfoWindow: returns nil.
        return UIView()
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        // Called after a marker's info window has been tapped.
    }

    // MARK: - Actions
    @IBAction func callButtonTapped(_ sender: Any) {
        
        switch true {
        case ApartmentController.shared.selectedApartment == nil :
            let callAlert = UIAlertController(title: "Choose an Apartment to Call", message: "Select an apartment in order to see more details about it.\nThen, tap the call button again in order to proceed.", preferredStyle: .actionSheet)
            let backAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            callAlert.addAction(backAction)
            present(callAlert, animated: true, completion: nil)
        case ApartmentController.shared.selectedApartment != nil :
            print("APARTMENT NOT NIL")
        default :
            print("CALLBUTTON ERROR")
        }
        
    }
}

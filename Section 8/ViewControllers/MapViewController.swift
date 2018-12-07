//
//  MapViewController.swift
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
    
    // MARK: - OUTLETS
    
    @IBOutlet var markerView: UIView!
    @IBOutlet weak var mapInstructionsLabel: UILabel!
    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var utahCountyMapView: GMSMapView!
    
    // MARK: - VARIABLES
    
    var markerViewIsVisible = false
    var userDidComeFromStep7 = false
    var locations: [ApartmentLocation]?
    
    // Observers on all of the following properties allow them to both be stored for later persistance, as well as update our outlets automatically.
    var currentPhone: String? {
        didSet {
            self.phoneLabel.text = currentPhone
        }
    }
    var currentName: String? {
        didSet {
            self.nameLabel.text = currentName
        }
    }
    var currentAddress: String? {
        didSet {
            self.addressLabel.text = currentAddress
        }
    }
    var currentImage: UIImage? {
        didSet {
            self.apartmentImageView.image = currentImage
        }
    }
    
    // MARK: - Setup and Data Fetches
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SelectedApartmentController.shared.loadSelectedApartment()
        setupMap()
        addMarkers()
        utahCountyMapView.delegate = self
        mapInstructionsLabel.text = NSLocalizedString("6aText", comment: "")
    }
    
    func setupMap() {
        
        utahCountyMapView.delegate = self
        // Current default camera position is at the "center" of Utah County.
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
    // TODO: Method that takes in a city and returns a CLLocationCoordinate2D in order to position camera.
    // Said method will operate in synchrony with liquid menu button in lower right corner.
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        // Move camera to display the tapped marker.
        utahCountyMapView.animate(to: GMSCameraPosition(target: CLLocationCoordinate2D(latitude: marker.position.latitude - 0.01, longitude: marker.position.longitude), zoom: utahCountyMapView.camera.zoom, bearing: 0, viewingAngle: 0))
        
        // Check to make sure that the ApartmentLocation and the marker we tapped are, in fact, the same place.
        guard let locations = locations else { return false }
        for location in locations {
            if location.geometry.location.lat == marker.position.latitude && location.geometry.location.lng == marker.position.longitude {
                
                // Fetch image from ApartmentLocation, using the photoreference retrieved in setupMarkers function.
                GoogleNetworkController.fetchPlaceImage(photoReference: location.photos?.first?.photo_reference ?? "") { (image) in
                    DispatchQueue.main.async {
                        self.currentImage = image
                        self.markerViewIsVisible = true
                    }
                }
                
                // Fetch place details using the place_ID retrieved in setupMarkers function.
                GoogleNetworkController.fetchPlaceDetails(placeID: location.place_id) { (name, phone, address) in
                    DispatchQueue.main.async {
                        self.currentName = name
                        self.currentPhone = phone
                        self.currentAddress = address
                    }
                }
            }
        }
        return true
    }
    
    // Any time the map begins to move, the markerView should disappear.
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        self.markerView.removeFromSuperview()
        markerViewIsVisible = false
        markerView.isHidden = false
        
    }
    
    // This method is called any time the map becomes stationary. Our markerView should become visible if we've tapped on a marker and the camera is centered on it - else it should stay invisible.
    func mapViewSnapshotReady(_ mapView: GMSMapView) {
        
        guard markerViewIsVisible != false else { return }
        self.view.addSubview(markerView)
        self.markerView.center = self.view.center
    }
    
    // MARK: - Actions
    
    @IBAction func callButtonTapped(_ sender: Any) {
        
        // Tapping the call button saves their current apartment.
        if let name = currentName, let phone = currentPhone, let address = currentAddress {
            SelectedApartmentController.shared.saveApartment(named: name, phone: phone, address: address)
        }
        
        // Determine whether or not they came from Step 7.
        switch userDidComeFromStep7 {
            
            // If they came from Step 7, pop the view controller.
        case true :
            self.navigationController?.popViewController(animated: true)
            
            // If they came from the Home screen, display an instance of Step 7.
        case false :
            guard let stepDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "stepsDetailTVC") as? StepDetailTVC else { return }
            stepDetailVC.selectedStep = StepController.shared.steps[6]
            stepDetailVC.userDidComeFromStep6 = true
            self.navigationController?.pushViewController(stepDetailVC, animated: true)
        }
    }
    @IBAction func xButtonTapped(_ sender: UIButton) {
        markerView.isHidden = true
    }
}

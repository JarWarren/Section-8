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

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    // MARK: - OUTLETS
    
    @IBOutlet var markerView: UIView!
    @IBOutlet weak var mapInstructionsLabel: UILabel!
    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var utahCountyMapView: GMSMapView!
    
    // MARK: - VARIABLES
    
    // Many of the following properties allow us to keep track of the current state of the map.
    var markerWasTapped = false // Helps determine whether the markerView should be visible.
    var userDidComeFromStep7 = false // Determines whether to segue to Step 7, or to pop the current view and display Step 7 underneath.
    var locations: [GMSMarker]? // Array of all currently displayed markers.
    var currentPhotoReferences: [String]? // Holds photo references for all photos on currently displayed marker.
    var addressPart1: String?; var addressPart2: String? // Holds split addresses for later display.
    var imageHolder: UIImage? // The image we display as default. (does not require a fetch)
    var imageRefHolder: String? // Name of the asset to be displayed throughout the rest of the app.
    var currentGalleryIndex = 0 // Keeps track of where we are in the image gallery when moving back and forth.
    
    // Observers on all of the following properties allow them to both be stored for later persistence, as well as update our outlets automatically.
    var markerViewIsVisible = false {
        didSet {
            print("MarkerView visible: 🤬\(self.markerViewIsVisible)")
        }
    }
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
        
        // Map functions
        SelectedApartmentController.shared.loadSelectedApartment()
        setupMap()
        addMarkers()
        utahCountyMapView.delegate = self
        mapInstructionsLabel.text = "6aText".localize
        
        // Add step title to navigation bar
        self.title = "step6".localize
    }
    
    func setupMap() {
        
        utahCountyMapView.delegate = self
        // Current default camera position is at the "center" of Orem City.
        utahCountyMapView.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: 40.2969, longitude: -111.6946), zoom: 10, bearing: 0, viewingAngle: 0)
        
    }
    
    // Creates markers at CLLocations for each apartment complex in our internal database.
    func addMarkers() {
        var markerHolder = [GMSMarker]()
        for apartment in Section8ApartmentController.shared.section8Apartments {
            let newMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: apartment.lat, longitude: apartment.lng))
            newMarker.map = utahCountyMapView
            markerHolder.append(newMarker)
        }
        locations = markerHolder
    }
    
    // Moves the map when a marker is tapped.
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        markerWasTapped = true
        currentPhotoReferences = nil
        currentGalleryIndex = 0
        
        // Move camera to display the tapped marker.
        utahCountyMapView.animate(to: GMSCameraPosition(target: CLLocationCoordinate2D(latitude: marker.position.latitude - 0.01, longitude: marker.position.longitude), zoom: utahCountyMapView.camera.zoom, bearing: 0, viewingAngle: 0))
        
        var googlePlaceID = ""
        // Check to make sure that the Section8Apartment and the marker we tapped are, in fact, the same place.
        guard locations != nil else { return false }
        for apartment in Section8ApartmentController.shared.section8Apartments {
            if apartment.lat == marker.position.latitude && apartment.lng == marker.position.longitude {
                self.currentImage = UIImage(named: apartment.apartmentPhoto); imageHolder = currentImage
                self.currentName = apartment.name
                self.currentPhone = apartment.phone
                self.currentAddress = apartment.address
                self.imageRefHolder = apartment.apartmentPhoto
                self.addressPart1 = apartment.address1Split
                self.addressPart2 = apartment.address2Split
                googlePlaceID = apartment.googlePlaceID
            }
        }
        GoogleNetworkController.fetchPlaceDetails(placeID: googlePlaceID) { (photoReferences) in
            self.currentPhotoReferences = photoReferences
            print("\(photoReferences.count) total images\n")
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
        
        if markerWasTapped == true {
            markerViewIsVisible = !markerViewIsVisible
        }
        guard markerViewIsVisible != false else { return }
        self.view.addSubview(markerView)
        self.markerView.center.x = self.view.center.x
        self.markerView.center.y = self.markerView.bounds.height
        if self.currentPhotoReferences == nil {
            leftButton.isHidden = true; rightButton.isHidden = true
        } else {
            leftButton.isHidden = false; rightButton.isHidden = false
        }
        markerWasTapped = false
    }
    
    // MARK: - Actions
    
    // Saves the currently selected apartment for persistence and usage throughout the app. Moves user forward (or backward) to Step 7.
    @IBAction func callButtonTapped(_ sender: Any) {
        
        // Saves their current apartment.
        if let name = currentName, let phone = currentPhone, let address = currentAddress, let part1 = addressPart1, let part2 = addressPart2 {
            SelectedApartmentController.shared.saveApartment(named: name, phone: phone, address: address, addressPart1: part1, addressPart2: part2, photoRef: self.imageRefHolder ?? "noApartmentImage".localize)
        }
        StepController.shared.steps[5].stepCompleted = true
        
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
    
    // Hides the markerView.
    @IBAction func xButtonTapped(_ sender: UIButton) {
        markerView.isHidden = true
    }
    
    // Displays the next image.
    @IBAction func rightButtonTapped(_ sender: Any) {
        guard let refs = currentPhotoReferences else { return }
        switch currentGalleryIndex {
        case refs.count - 1:
            currentGalleryIndex = 0
            currentImage = imageHolder
            return
        default: currentGalleryIndex += 1
        }
        GoogleNetworkController.fetchPlaceImage(photoReference: refs[currentGalleryIndex]) { (image) in
            print(self.currentGalleryIndex)
            DispatchQueue.main.async {
                self.currentImage = image
            }
        }
    }
    
    // Displays the previous image.
    @IBAction func leftButtonTapped(_ sender: Any) {
        guard let refs = currentPhotoReferences else { return }
        switch currentGalleryIndex {
        case 0: currentGalleryIndex = refs.count - 1
        currentImage = imageHolder
            return
        default: currentGalleryIndex -= 1
        }
        GoogleNetworkController.fetchPlaceImage(photoReference: refs[currentGalleryIndex]) { (image) in
            print(self.currentGalleryIndex)
            DispatchQueue.main.async {
                self.currentImage = image
            }
        }
    }
}

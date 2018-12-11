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
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var utahCountyMapView: GMSMapView!
    
    // MARK: - VARIABLES
    
    var currentImageGallery = [UIImage]()
    var markerWasTapped = false
    var markerViewIsVisible = false {
        didSet {
            print("🤬\(self.markerViewIsVisible)")
        }
    }
    var userDidComeFromStep7 = false
    var locations: [GMSMarker]?
    
    // Observers on all of the following properties allow them to both be stored for later persistance, as well as update our outlets automatically.
    var currentPhotoReferences: [String]?
    var currentGallery: [UIImage]?
    var imageHolder: UIImage?
    var imageRefHolder: String?
    var currentGalleryIndex = 0
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
        
        // Move camera to display the tapped marker.
        utahCountyMapView.animate(to: GMSCameraPosition(target: CLLocationCoordinate2D(latitude: marker.position.latitude - 0.01, longitude: marker.position.longitude), zoom: utahCountyMapView.camera.zoom, bearing: 0, viewingAngle: 0))
        
        // Check to make sure that the ApartmentLocation and the marker we tapped are, in fact, the same place.
        guard locations != nil else { return false }
        for apartment in Section8ApartmentController.shared.section8Apartments {
            if apartment.lat == marker.position.latitude && apartment.lng == marker.position.longitude {
                self.currentImage = UIImage(named: apartment.apartmentPhoto); imageHolder = currentImage
                self.currentName = apartment.name
                self.currentPhone = apartment.phone
                self.currentAddress = apartment.address
                self.imageRefHolder = apartment.apartmentPhoto
            }
            GoogleNetworkController.fetchPlaceDetails(placeID: apartment.googlePlaceID) { (photoReferences) in
                self.currentPhotoReferences = photoReferences
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
    
        if markerWasTapped == true {
            markerViewIsVisible = !markerViewIsVisible
        }
        guard markerViewIsVisible != false else { return }
        self.view.addSubview(markerView)
        self.markerView.center.x = self.view.center.x
        self.markerView.center.y = self.markerView.bounds.height
        if self.currentImage == UIImage(named: "noApartmentImage") {
            leftButton.isHidden = true; rightButton.isHidden = true
        } else {
            leftButton.isHidden = false; rightButton.isHidden = false
        }
        markerWasTapped = false
    }
    
    // MARK: - Actions
    
    @IBAction func callButtonTapped(_ sender: Any) {
        
        let photoRef: String? = {
            switch currentGalleryIndex {
            case 0:
                return imageRefHolder
            default:
                return currentPhotoReferences?[currentGalleryIndex - 1]
            }
        }()
        
        // Tapping the call button saves their current apartment.
        if let name = currentName, let phone = currentPhone, let address = currentAddress {
            SelectedApartmentController.shared.saveApartment(named: name, phone: phone, address: address, photoRef: photoRef ?? "noApartmentImage")
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
    @IBAction func xButtonTapped(_ sender: UIButton) {
        markerView.isHidden = true
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        guard let refs = currentPhotoReferences else { return }
        switch currentGalleryIndex {
        case refs.count - 1:
            currentGalleryIndex = 0
            currentImage = imageHolder
            return
        default: currentGalleryIndex += 1
        }
        GoogleNetworkController.fetchPlaceImage(photoReference: refs[currentGalleryIndex - 1]) { (image) in
            print(self.currentGalleryIndex - 1)
            DispatchQueue.main.async {
                self.currentImage = image
            }
        }
    }
    
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

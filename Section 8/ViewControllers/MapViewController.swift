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
    var markerView: UIView?
    var currentPhone: String? {
        didSet {
            self.phoneLabel.text = currentPhone
        }
    }
    var currentName: String? {
        didSet {
                self.nameLabel.text = self.currentName
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
    //TODO: Method that takes in a city and returns a CLLocationCoordinate2D in order to position camera.
    
    // MARK: - Data Source Methods
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        utahCountyMapView.animate(to: GMSCameraPosition(target: marker.position, zoom: 12, bearing: 0, viewingAngle: 0))
        
        setupMarkerView(marker: marker)
        
        if let markerView = markerView {
            //            markerView.isHidden = false
            constrainApartmentImageView(view: markerView)
            constrainNameLabel(view: markerView)
            constrainPhoneLabel(view: markerView)
            constrainAddressLabel(view: markerView)
        }
        
        
        guard let locations = locations else { return false }
        for location in locations {
            if location.geometry.location.lat == marker.position.latitude && location.geometry.location.lng == marker.position.longitude {
                GoogleNetworkController.fetchPlaceImage(photoReference: location.photos?.first?.photo_reference ?? "") { (image) in
                    DispatchQueue.main.async {
                        self.currentImage = image
                    }
                }
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
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
                 markerView?.isHidden = true
//        markerView?.removeFromSuperview()
        //        markerView = nil
        //TODO: Nuke markerView without ruining map.
    }
    
    func mapViewSnapshotReady(_ mapView: GMSMapView) {
        markerView?.isHidden = false
//        guard let markerView = markerView else { return }
//        utahCountyMapView.addSubview(markerView)
    }
    
    // TODO: Figure out why none of the following breakpoints are ever hit/use a different method if necessary.
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
    
    // MARK: - MarkerView Methods
    func setupMarkerView(marker: GMSMarker) {
        
        let markerView = UIView()
        self.utahCountyMapView.addSubview(markerView)
        markerView.translatesAutoresizingMaskIntoConstraints = false
        markerView.backgroundColor = UIColor.white
        markerView.cornerRadius = 25
        markerView.borderWidth = 5
        markerView.borderColor = UIColor.darkGray
        NSLayoutConstraint.activate([
            markerView.heightAnchor.constraint(equalToConstant: 250),
            markerView.widthAnchor.constraint(equalToConstant: 350),
            markerView.centerXAnchor.constraint(equalTo: utahCountyMapView.centerXAnchor),
            markerView.centerYAnchor.constraint(equalTo: utahCountyMapView.centerYAnchor, constant: -150)
            ])
        self.markerView = markerView
        //TODO: Create a reusable custom view that contains name, address, phone and photo.
    }
    
    let apartmentImageView: UIImageView = {
        var apartment = UIImageView()
        apartment.backgroundColor = UIColor.brown
        apartment.cornerRadius = 10
        return apartment
    }()
    func constrainApartmentImageView(view: UIView) {
        apartmentImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(apartmentImageView)
        NSLayoutConstraint.activate([
            apartmentImageView.heightAnchor.constraint(equalToConstant: 125),
            apartmentImageView.widthAnchor.constraint(equalToConstant: 150),
            apartmentImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            apartmentImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15)
            ])
    }
    
     var nameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    func constrainNameLabel(view: UIView){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: 165),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
            ])
    }
    
    let phoneLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    func constrainPhoneLabel(view: UIView){
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneLabel)
        NSLayoutConstraint.activate([
            phoneLabel.widthAnchor.constraint(equalToConstant: 150),
            phoneLabel.topAnchor.constraint(equalTo: apartmentImageView.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
            ])
    }
    
    let addressLabel: UILabel = {
        var label = UILabel()
        label.text = "1 test 2 address, from, ME 34567"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    func constrainAddressLabel(view: UIView){
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.widthAnchor.constraint(equalToConstant: 165),
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
            ])
    }
}

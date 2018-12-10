//
//  HomeTVC.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import CoreLocation

class HomeTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Constants
    
    let completedCheckBoxImage = UIImage(named: "home_checked")
    let incompleteCheckBoxImage = UIImage(named: "home_unchecked")
    private let locationManger = CLLocationManager()
    private let geocoder = CLGeocoder()
    // MARK: - VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManger.requestAlwaysAuthorization()
        case .restricted:
            print("Users location is restricted")
        case .denied:
            AlertControllerManager.presentAlertControllerWith(title: "Location Services Disabled", message: "This device is not allowed to use location services. Section 8 app needs your location in order to properly display notification. If you wish to later change this it can be done in your phones settings.")
        case .authorizedWhenInUse:
            print("user granted authorizedWhenInUse")
        default:
            break
        }
        locationManger.startUpdatingLocation()
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StepController.shared.steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as? StepTVCell else { return UITableViewCell() }
        
        let step = StepController.shared.steps[indexPath.row]
        
        // Configure the cell
        cell.stepImageView.image = UIImage(named: step.homeImageName)
        cell.stepNumberLabel.text = step.stepNumber
        cell.stepNameLabel.text = step.name
        
        if step.stepCompleted {
            cell.checkBoxView.image = completedCheckBoxImage
        } else {
            cell.checkBoxView.image = incompleteCheckBoxImage
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // What is the index of the Map step
        if indexPath.row == 5 {
            performSegue(withIdentifier: "toMapDetail", sender: nil)
        } else {
            performSegue(withIdentifier: "toStepDetail", sender: tableView.cellForRow(at: indexPath))
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStepDetail" {
            guard let destinationVC = segue.destination as? StepDetailTVC, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
            
            let selectedStep = StepController.shared.steps[indexPath.row]
            destinationVC.selectedStep = selectedStep
        } else if segue.identifier == "toMapDetail" {
            // Do nothing
        }
    }
}

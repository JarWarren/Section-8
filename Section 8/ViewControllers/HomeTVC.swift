//
//  HomeTVC.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit


class HomeTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Constants
    
    let completedCheckBoxImage = UIImage(named: "home_checked")
    let incompleteCheckBoxImage = UIImage(named: "home_unchecked")
   
    // MARK: - VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManger.delegate = self 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    
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

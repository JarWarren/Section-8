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
    
    // MARK: - VIEWS FUNCTIONS

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StepController.steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath) as? StepTableViewCell else { return UITableViewCell() }
        
        let step = StepController.steps[indexPath.row]
        print(step.homeImageName)
        
        // Configure the cell
        cell.stepImageView.image = UIImage(named: step.homeImageName)
        cell.stepNumberLabel.text = step.stepNumber
        cell.stepNameLabel.text = step.name
        return cell
        
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

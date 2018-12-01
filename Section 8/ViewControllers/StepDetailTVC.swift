//
//  StepDetailTVC.swift
//  Section 8
//
//  Created by Arkin Hill on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import UIKit
import UserNotifications

class StepDetailTVC: UIViewController, UITableViewDataSource, UITableViewDelegate, TimerControllerDelegete {
    
    
    // MARK: - LANDING PAD & SOURCE OF TRUTH
    
    var selectedStep: Step? {
        didSet {
            items = selectedStep!.items
        }
    }
    
    var items: [Item] = []
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var completeButtonStatus: UIButton!
    
    // MARK: - Constants
    
    let timerController = TimerController()
    let timeKeepingId = "timerID"
    let sevenDayCountDown = TimeInterval(5)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // timer
        timerController.delegate = self
        timerController.startTimer(time: sevenDayCountDown)
        //Need to figure out if this is what gets rid of the badge icon
        timerController.cancelLocalNotificationWith(identifier: "NotificationID")
        
        // Change title to specific step
        if let thisStep = selectedStep {
            if !thisStep.stepCompleted {
                completeButtonStatus.setTitle("MARK \(thisStep.stepNumber) COMPLETE", for: .normal)
                
            } else {
                completeButtonStatus.setTitle("MARK \(thisStep.stepNumber) INCOMPLETE", for: .normal)
            }
            self.stepNameLabel.text = thisStep.name
            self.stepNumberLabel.text = thisStep.stepNumber
            self.stepImageView.image = UIImage(named: thisStep.stepImageName)
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func completeButton(_ sender: UIButton) {
        guard let unwrappedStep = selectedStep else {return}
        switch unwrappedStep.stepCompleted {
        case false:
            print("🔥Step # \(unwrappedStep.stepNumber) was originally set to inComplete but now its complete🤗")
            unwrappedStep.stepCompleted = true
        case true:
            print("🔥Step # \(unwrappedStep.stepNumber) was originally set to Complete but now its not compelted😭")
            unwrappedStep.stepCompleted = false
        }
         timerController.startTimer(time: sevenDayCountDown)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        switch item.format {
            
        case .tip:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as? TipTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.tipTitleLabel?.text = item.title
            cell.tipTextLabel?.text = item.text
            
            return cell
            
        case .paragraph:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "paragraphCell", for: indexPath) as? ParagraphTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.paragraphTextLabel?.text = item.text
            return cell
            
        case .paragraphWithButton:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "plaragraphWithButtonCell", for: indexPath) as? ParagraphWithButtonTVCell else { return UITableViewCell() }
            return cell
            
        case .datePicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as? ParagraphWithButtonTVCell else { return UITableViewCell() }
            return cell
        }
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension StepDetailTVC {
    
    // MARK: - Time Controller Delegate
    func timerSecondTick() {
        // NOTE: - In here we can put in a label that will become a visible timer to show the user how long they have before their housing voucher expires
        /*
         example:
         visableLabel.text = timerontroller.timeAsString()
         */
    }
    
    func timerCompleted() {
        let timerEndedAlert = AlertControllerManager.presentAlertControllerWith(title: "We miss you", message: "The're hasn't been much progress come back and lets get going !!!")
        present(timerEndedAlert, animated: true, completion: nil)
    }
    
    func timerStopped() {
        // This func will completely stop the on going 7 day timer 
        timerController.timer?.invalidate()
    }
    
  
}

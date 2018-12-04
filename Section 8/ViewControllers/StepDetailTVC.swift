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
    
    // MARK: - CONSTANTS
    
    let timerController = TimerController()
    let timeKeepingId = "timerID"
    let sevenDayCountDown = TimeInterval(5)
    let sevenDays = 60
    var boolValueToTestTimer = true
    let sevenDayTimerID = "sevenDays"
    let notificationActionID = "dismissActionKey"
    
    // MARK: - VIEW DID LOAD & VIEW WILL APPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Change title to specific step
        if let thisStep = selectedStep {
            if !thisStep.stepCompleted {
                
                completeButtonStatus.setTitle(" CLICK WHEN \(thisStep.stepNumber) IS COMPLETE ", for: .normal)
            } else {
                completeButtonStatus.setTitle(" CLICK TO CHANGE \(thisStep.stepNumber) TO INCOMPLETE ", for: .normal)
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
        checkButtonStatusNotificationSet()
        finalStepButtonTapped()
        navigationController?.popViewController(animated: true)
    }
    
    func checkButtonStatusNotificationSet() {
        guard let unwrappedStep = selectedStep else {return}
        if unwrappedStep.stepNumber != "STEP 14"  {
            cancelSevenDayNotification()
            scheduleSevenDayNotification()
        }
    }
    
    func finalStepButtonTapped() {
        guard let unwrappedStep = selectedStep else {return}
        if unwrappedStep.stepNumber == "STEP 14" && unwrappedStep.stepCompleted == true {
            cancelSevenDayNotification()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        } else {
            if unwrappedStep.stepNumber == "STEP 14" && unwrappedStep.stepCompleted != true {
                scheduleSevenDayNotification()
            }
        }
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
            cell.paragraphTitleLabel?.text = item.title
            cell.paragraphTextLabel?.text = item.text
            return cell
            
        case .clickLink:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "clickLinkCell", for: indexPath) as? ClickLinkTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.clickLinkTitleLabel?.text = item.title
            cell.clickLinkTextLabel?.text = item.text
            cell.clickLinkButtonText?.setTitle("\(item.buttonText ?? "CLICK TO GO TO LINK")", for: .normal)
            if let urlString = item.url {
                cell.url = URL(string: urlString)
            }
            // CAN WE PASS THROUGH ITEM.URL
            return cell
            
        case .datePicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as? DatePickerTVCell else { return UITableViewCell() }
            cell.delegate = self
            
            // Configure cell
            cell.datePickerTitleLabel?.text = item.title
            cell.datePickerTextLabel?.text = item.text
            cell.datePickerButtonTextLabel?.setTitle("\(item.buttonText ?? "CLICK TO SET DATE")", for: .normal)
            return cell
            
        case .dataInput:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataInputCell", for: indexPath) as? DataInputTVCell else { return UITableViewCell() }
            
            // Set delegate to custom view cell
            // (Step 5 of 5 - 3 steps in child, 2 in parent(this file))
            cell.delegate = self
            
            // Configure cell
            cell.dataInputTitleLabel?.text = item.title
            cell.dataInputTextLabel?.text = item.text
            return cell
            
        case .dataDisplay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataDisplayCell", for: indexPath) as? DataDisplayTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.dataDisplayTitleLabel.text = item.title
            cell.dataDisplayTextLabel?.text = item.text
            cell.dataDisplayDataLabel?.text = "NEED TO LINK TO MAX RENT"
            return cell
        }
    }
}

// MARK: - DATE PICKER CELL DELEGATE

extension StepDetailTVC: DatePickerTVCellDelegate {
    func datePickerButtonTapped(_ sender: DatePickerTVCell, _ picker: UIDatePicker) {
        // SET UP NOTIFCATION CENTER STUFF
    }
}

// MARK: - DATA INPUT CELL DELEGATE

// Conforming to delegate set above -
// (Step 4 of 5 - 3 steps in child, 2 in parent(this file))
extension StepDetailTVC: DataInputTVCellDelegate {
    func dataInputButtonTapped(_ sender: DataInputTVCell, _ textField1: UITextField, _ textField2: UITextField) {
        // SET UP CODE TO TAKE MAX RENT DATA
    }
}

// MARK: - ATTRIBUTES INSPECTOR EXPANDER CODE

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
        timerController.startTimer(time: 3)
        print("\nTimer hit zero and completed\n")
    }
    
    func timerStopped() {
        // This func will completely stop the on going 7 day timer 
        timerController.timer?.invalidate()
    }
    
    func cancelSevenDayNotification() {
        timerController.cancelLocalNotificationWith(identifier: notificationActionID)
        print("\n🐙🗓  7 day notification canceled\n")
    }
    
    func scheduleSevenDayNotification() {
        print("\n📅 7 day notification set\n")
        timerController.scheduleLocalNotificationFor2(identifier: sevenDayTimerID,
                                                      actionTitle: "Dismiss", categoryID: notificationActionID, contentTitle: "🚨Content Title", contentBody: "Content Body", contentBadge: 1,
                                                      contentSound: UNNotificationSound.default, contentLuanchImage: "IMAGE_NAME", desiredTimeInterval: sevenDays)
    }
    
}

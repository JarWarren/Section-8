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
    var userDidComeFromStep6 = false
    
    
    var alarm: Alarm?
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var stepNumberLabel: UILabel!
    @IBOutlet weak var stepNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var completeButtonStatus: UIButton!
    
    // MARK: - CONSTANTS
    
    let timerController = TimerController()
    let timeKeepingId = "timerID"
    
    // Let sevenDayCountDown = TimeInterval(5)
    let sevenDays = 60
    
    // BoolValueToTestTimer = true
    let sevenDayTimerID = "sevenDays"
    let categorySevenNotificationID = "dismissActionKey"
    let datePActionId = "datePickerNotifID"
    let datePCategoryId = "dateCatergoryID"
    var alarmIsOn: Bool = false
    
    // seven day interval constants for notification function
    let dissmissActionSdId = "SevenDayDissmissActionID"
    let categorySdID = "sevenDayCatergoryID"
    let requestSdId = "sevenDayRequestID"
    let resourceSdID = "sevenDayResourceID"
    let typePng = "png"
    
    // 7-Day notification alert
    let sevenDayNotifBanner = NSString.localizedUserNotificationString(forKey: "notificationBanner", arguments: [])
    let sevenDayDissmissTitle = NSString.localizedUserNotificationString(forKey: "7DayDismiss", arguments: [])
    let sevenDayContentTitle = NSString.localizedUserNotificationString(forKey: "7DayContentTitle", arguments: [])
    let sevenDayContentSubtitle = NSString.localizedUserNotificationString(forKey: "7DayContentSubtitle", arguments: [])
    let sevenDayContentBody = NSString.localizedUserNotificationString(forKey: "7DayContentBody", arguments: [])
    
    // date Banner
    let datePickerNotifBanner = NSString.localizedUserNotificationString(forKey: "datePickerBanner", arguments: [])
    let bannerImageName = NSLocalizedString("notificationBanner", comment: "")
    
    // MARK: - VIEW DID LOAD & VIEW WILL APPEAR
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Persistence
        SelectedApartmentController.shared.loadSelectedApartment()
        RentController.shared.loadFromPersistentStorage()
        
        // Change title to specific step
        if let thisStep = selectedStep {
            if !thisStep.stepCompleted {
                completeButtonStatus.setTitle(NSLocalizedString("completeButtonTextTapToMarkCompleteA", comment: "") + " \(thisStep.stepNumber) " + NSLocalizedString("completeButtonTextTapToMarkCompleteB", comment: ""), for: .normal)
            } else {
                completeButtonStatus.setTitle(NSLocalizedString("completeButtonTextTapToMarkIncompleteA", comment: "") + " \(thisStep.stepNumber) " + NSLocalizedString("completeButtonTextTapToMarkIncompleteB", comment: ""), for: .normal)
            }
            // Header labels and image
            self.stepNameLabel.text = thisStep.name
            self.stepNumberLabel.text = thisStep.stepNumber
            self.stepImageView.image = UIImage(named: thisStep.homeImageName)
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func completeButton(_ sender: UIButton) {
        guard let unwrappedStep = selectedStep else {return}
        switch unwrappedStep.stepCompleted {
        case false:
            print("Step # \(unwrappedStep.stepNumber) was originally set to inComplete but now its complete")
            unwrappedStep.stepCompleted = true
        case true:
            print("Step # \(unwrappedStep.stepNumber) was originally set to Complete but now its not compelted")
            unwrappedStep.stepCompleted = false
        }
        checkButtonStatusNotificationSet()
        finalStepButtonTapped()
        StepController.shared.persistCompletedSteps()
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - BUTTON FUNCTIONS
    
    func checkButtonStatusNotificationSet() {
        guard let unwrappedStep = selectedStep else {return}
        if unwrappedStep.stepNumber != "STEP 14"  {
            cancelSevenDayNotification()
            
            scheduleSevenDayIntervalNotif()
        }
    }
    
    func finalStepButtonTapped() {
        guard let unwrappedStep = selectedStep else {return}
        if unwrappedStep.stepNumber == "STEP 14" && unwrappedStep.stepCompleted == true {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        } else {
            if unwrappedStep.stepNumber == "STEP 14" && unwrappedStep.stepCompleted != true {
                scheduleSevenDayIntervalNotif()
            }
        }
    }
    
    // MARK: - TABLE VIEW DATA SOURCE
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        // MARK: - CUSTOM CELL SWTICH
        
        // Switch to choose which custom cell mataches the item format
        switch item.format {
            
        // MARK: CLICK LINK CUSTOM CELL
            
        case .clickLink:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "clickLinkCell", for: indexPath) as? ClickLinkTVCell else { return UITableViewCell() }
            
            // Set delegate to custom view cell
            // (Step 5 of 5 - 3 steps in child, 2 in parent(this file))
            cell.delegate = self
            
            // Configure cell
            cell.clickLinkTitleLabel?.text = item.title
            cell.clickLinkTextLabel?.text = item.text
            cell.clickLinkButtonText?.setTitle("\(item.buttonText ?? "TAP TO GO TO LINK")", for: .normal)
            if let urlString = item.url {
                cell.url = URL(string: urlString)
            }
            return cell
            
        // MARK: DATA DISPLAY CUSTOM CELL
            
        case .dataDisplay:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataDisplayCell", for: indexPath) as? DataDisplayTVCell else { return UITableViewCell() }
            if let rent = RentController.shared.rent {
                cell.dataDisplayTitleLabel.text = item.title
                cell.dataDisplayTextLabel?.text = item.text
                cell.dataDisplayDataLabel?.text = "$\(rent.maxRent) per month or lower"
            } else {
                // Configure cell
                cell.dataDisplayTitleLabel.text = item.title
                cell.dataDisplayTextLabel?.text = item.text
                cell.dataDisplayDataLabel?.text = "Maximum rent not yet calculated"
            }
            return cell
            
        // MARK: DATA INPUT CUSTOM CELL
            
        case .dataInput:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dataInputCell", for: indexPath) as? DataInputTVCell else { return UITableViewCell() }
            
            // Set delegate to custom view cell
            // (Step 5 of 5 - 3 steps in child, 2 in parent(this file))
            cell.delegate = self
            
            // Configure cell
            cell.dataInputTitle1Label?.text = item.title
            cell.dataInputText1Label?.text = item.text
            cell.dataInputTitle2Label?.text = item.url
            cell.dataInputText2Label?.text = item.graphicName
            cell.dataInputText2Field?.text = String(describing: RentController.shared.rent?.voucherAmount)
            cell.dataInputButtonTextLabel?.setTitle("\(item.buttonText ?? "TAP TO SAVE")", for: .normal)
            
            // Passing through to fields household income and voucher amount, if entered previously
            if let householdIncome = RentController.shared.rent?.householdIncome {
                cell.dataInputText1Field?.text = "$" + String(describing: householdIncome)
            } else {
                cell.dataInputText1Field.text = ""
            }
            if let voucherAmount = RentController.shared.rent?.voucherAmount {
                cell.dataInputText2Field?.text = "$" + String(describing: voucherAmount)
            } else {
                cell.dataInputText2Field.text = ""
            }
            return cell
            
        // MARK: DATE PICKER CUSTOM CELL
            
        case .datePicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "datePickerCell", for: indexPath) as? DatePickerTVCell else { return UITableViewCell() }
            
            // Set delegate to custom view cell
            // (Step 5 of 5 - 3 steps in child, 2 in parent(this file))
            cell.delegate = self
            
            // Configure cell
            cell.datePickerTitleLabel?.text = item.title
            cell.datePickerTextLabel?.text = item.text
            cell.datePickerButton?.setTitle("\(item.buttonText ?? "TAP TO SET DATE")", for: .normal)
            return cell
            
        // MARK: PARAGRAPH CUSTOM CELL
            
        case .paragraph:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "paragraphCell", for: indexPath) as? ParagraphTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.paragraphTitleLabel?.text = item.title
            cell.paragraphTextLabel?.text = item.text
            return cell
            
        // MARK: PHOTO CUSTOM CELL
            
        case .photo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? PhotoTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.photoImageView.image = UIImage(named: item.graphicName ?? "")
            return cell
            
        // MARK: PHOTO CUSTOM CELL
            
        case .apartmentPhoto:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "apartmentPhotoCell", for: indexPath) as? ApartmentPhotoTVCell else { return UITableViewCell() }
            
            // Display which apartment they've chosen.
            if let photoRef = SelectedApartmentController.shared.selectedApartment?.photoRef {
                cell.apartmentPhotoImageView.image = UIImage(named: photoRef)
                return cell
            }
            
            // What to display if they haven't chosen one
            cell.apartmentPhotoImageView?.image = UIImage(named: "noApartmentImage")
            return cell
            
        // MARK: TIP CUSTOM CELL
            
        case .tip:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as? TipTVCell else { return UITableViewCell() }
            
            // Configure cell
            cell.tipTitleLabel?.text = item.title
            cell.tipTextLabel?.text = item.text
            cell.tipImageView?.image = UIImage(named: item.graphicName ?? "")
            
            return cell
        }
    }
    
    // MARK: - NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "backToMapDetail" {
            guard let destinationVC = segue.destination as? MapViewController else { return }
            destinationVC.userDidComeFromStep7 = true
        }
    }
}

// MARK: - CUSTOM CELL EXTENSIONS

// MARK: - CLICK LINK CELL DELEGATE EXTENSION

// Conforming to delegate set above -
// (Step 4 of 5 - 3 steps in child, 2 in parent(this file))

extension StepDetailTVC: ClickLinkTVCellDelegate {
    func clickLinkButtonTapped(_ sender: ClickLinkTVCell) {
        
        // Step 7 - Item 7g - Button that calls apartment phone number
        if sender.clickLinkButtonText?.titleLabel?.text == NSLocalizedString("7hButtonText", comment: "") {
            guard let phone = SelectedApartmentController.shared.selectedApartment?.phone else { return }
            guard let url = URL(string: "telprompt://\(phone)") else { return }
            UIApplication.shared.open(url)
        }
        
        // Step 7 - Item 7h - Button that returns to Step 6
        if sender.clickLinkButtonText?.titleLabel?.text == NSLocalizedString("7iButtonText", comment: "") {
            if self.userDidComeFromStep6 == true{
                self.navigationController?.popViewController(animated: true)
            } else {
                performSegue(withIdentifier: "backToMapDetail", sender: nil)
            }
        }
    }
}

// MARK: - DATA INPUT CELL DELEGATE EXTENSION

// Conforming to delegate set above -
// (Step 4 of 5 - 3 steps in child, 2 in parent(this file))

extension StepDetailTVC: DataInputTVCellDelegate {
    func dataInputButtonTapped(_ sender: DataInputTVCell, _ textField1: UITextField, _ textField2: UITextField) {
        
        // Unwrap
        guard let householdIncomeAsString = textField1.text?.trimmingCharacters(in: .symbols),
            let voucherAmountAsString = textField2.text?.trimmingCharacters(in: .symbols),
            let householdIncome = Int(householdIncomeAsString),
            let voucherAmount = Int(voucherAmountAsString) else { return }
        
        // Generate the max rent and reload the tableView to show amount
        RentController.shared.createMaxRent(householdIncome: householdIncome, voucherAmount: voucherAmount)
        tableView.reloadData()
    }
}


// MARK: - 7-DAY NOTIFICATION EXTENSION

extension StepDetailTVC {
    
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
        
        timerController.cancelLocalNotificationWith(identifier: Constants.categorySevenNotificationID)
        print("\n7 day notification canceled\n")
    }
    
    
    func scheduleSevenDayIntervalNotif() {
        print("\n7 day notification was set\n")
        
        timerController.scheduleLocalNotifInterval(dismissActionID: Constants.dismissActionSdId, actionTitle: Constants.sevenDayDismissTitle, categoryID: Constants.categorySdID, contentTitle: Constants.sevenDayContentTitle, contentSubtitle: Constants.sevenDayContentSubtitle, contentBody: Constants.sevenDayContentBody, contentBadge: 1, contentSound: UNNotificationSound.default, contentLaunchImage: "", desiredTimeInterval: Constants.sevenDays, resourceName: Constants.sevenDayNotifBanner, extenstionType: Constants.typePng, resourceID: Constants.resourceSdID, requestID: Constants.requestSdId)

    }
}


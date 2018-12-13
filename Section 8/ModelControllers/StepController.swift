//
//  StepController.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class StepController {
    
    // Shared instance
    static let shared = StepController()
    
    // MARK: - STEPS DATA
    
    // Source of truth
    var steps: [Step] = {
        
        let step1 = Step(name: "step1".localize, stepNumber: NSLocalizedString("STEP", comment: "") + " 1", stepCompleted: false, homeImageName: "home1", stepImageName: "step1")
        let step2 = Step(name: NSLocalizedString("step2", comment: ""), stepNumber: "STEP 2", stepCompleted: false, homeImageName: "home2", stepImageName: "step2")
        let step3 = Step(name: "step3".localize, stepNumber: "STEP 3", stepCompleted: false, homeImageName: "home3", stepImageName: "step3")
        let step4 = Step(name: NSLocalizedString("step4", comment: ""), stepNumber: "STEP 4", stepCompleted: false, homeImageName: "home4", stepImageName: "step4")
        let step5 = Step(name: NSLocalizedString("step5", comment: ""), stepNumber: "STEP 5", stepCompleted: false, homeImageName: "home5", stepImageName: "step5")
        let step6 = Step(name: NSLocalizedString("step6", comment: ""), stepNumber: "STEP 6", stepCompleted: false, homeImageName: "home6", stepImageName: "step6")
        let step7 = Step(name: NSLocalizedString("step7", comment: ""), stepNumber: "STEP 7", stepCompleted: false, homeImageName: "home7", stepImageName: "step7")
        let step8 = Step(name: NSLocalizedString("step8", comment: ""), stepNumber: "STEP 8", stepCompleted: false, homeImageName: "home8", stepImageName: "step8")
        let step9 = Step(name: NSLocalizedString("step9", comment: ""), stepNumber: "STEP 9", stepCompleted: false, homeImageName: "home9", stepImageName: "step9")
        let step10 = Step(name: NSLocalizedString("step10", comment: ""), stepNumber: "STEP 10", stepCompleted: false, homeImageName: "home10", stepImageName: "step10")
        let step11 = Step(name: NSLocalizedString("step11", comment: ""), stepNumber: "STEP 11", stepCompleted: false, homeImageName: "home11", stepImageName: "step11")
        let step12 = Step(name: NSLocalizedString("step12", comment: ""), stepNumber: "STEP 12", stepCompleted: false, homeImageName: "home12", stepImageName: "step12")
        let step13 = Step(name: NSLocalizedString("step13", comment: ""), stepNumber: "STEP 13", stepCompleted: false, homeImageName: "home13", stepImageName: "step13")
        let step14 = Step(name: NSLocalizedString("step14", comment: ""), stepNumber: "STEP 14", stepCompleted: false, homeImageName: "home14", stepImageName: "step14")
        
        return [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14]
    }()
    
    // MARK: - ITEMS FUNCTION
    
    init() {
        addItemsToSteps()
    }
    
    func addItemsToSteps() {
        
        for step in steps {
            switch step.stepNumber {
            
            // MARK: - STEP 1
                
            case NSLocalizedString("STEP", comment: "") + " 1":
                
                // Step 1 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step1", format: .photo, step: step)
                
                // Step 1 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 1a - Intro
                ItemController.addNewItem(title: nil, text: "1aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 1b - Viewing tip
                ItemController.addNewItem(title: NSLocalizedString("1bTitle", comment: ""), text: NSLocalizedString("1bText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 1c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "onlineApplication", format: .photo, step: step)
                
                // Item 1d - Finished button
                ItemController.addNewItem(title: NSLocalizedString("1dTitle", comment: ""), text: NSLocalizedString("1dText", comment: ""), buttonText: nil, url: nil, graphicName: "return", format: .tip, step: step)
                
                // Item 1e - Online application
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1eText", comment: ""), buttonText: NSLocalizedString("1eButtonText", comment: ""), url: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011", graphicName: nil, format: .clickLink, step: step)
                
                // Item 1f - Completed
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
            
                
            // MARK: - STEP 2
                
            case NSLocalizedString("STEP", comment: "") + " 2":
                
                // Step 2 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step2", format: .photo, step: step)

                // Step 2 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 2a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2b - Housing office info
                ItemController.addNewItem(title: NSLocalizedString("2bTitle", comment: ""), text: NSLocalizedString("2bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 2c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 2d - Waiting list paragraph
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2e - Waiting list tip
                ItemController.addNewItem(title: NSLocalizedString("2eTitle", comment: ""), text: NSLocalizedString("2eText", comment: ""), buttonText: nil, url: nil, graphicName: "waitingList", format: .tip, step: step)
                
                // Item 2f - Tap complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 3
                
            case NSLocalizedString("STEP", comment: "") + " 3":
                
                // Step 3 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step3", format: .photo, step: step)
                
                // Step 3 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 3a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3b - Appointment date picker
                ItemController.addNewItem(title: NSLocalizedString("3bTitle", comment: ""), text: NSLocalizedString("3bText", comment: ""), buttonText: NSLocalizedString("3bButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 3c - Read carefully
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3d - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("3dTitle", comment: ""), text: NSLocalizedString("3dText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 3e - Here is address
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3f - Housing office info
                ItemController.addNewItem(title: NSLocalizedString("3fTitle", comment: ""), text: NSLocalizedString("3fText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 3g - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 3h - Tap complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3hText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
               
                
            // MARK: - STEP 4
                
            case NSLocalizedString("STEP", comment: "") + " 4":
                
                // Step 4 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step4", format: .photo, step: step)
                
                // Step 4 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 4a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4b - Housing office info
                ItemController.addNewItem(title: NSLocalizedString("4bTitle", comment: ""), text: NSLocalizedString("4bText", comment: ""), buttonText: nil, url: nil, graphicName: "phone", format: .tip, step: step)
                
                // Item 4c - Description of briefing
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4d - Briefing date picker
                ItemController.addNewItem(title: NSLocalizedString("4dTitle", comment: ""), text: NSLocalizedString("4dText", comment: ""), buttonText: NSLocalizedString("4dButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 4e - If need to reschedule
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4f - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("4fTitle", comment: ""), text: NSLocalizedString("4fText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 4g - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 5
                
            case NSLocalizedString("STEP", comment: "") + " 5":
                
                // Step 5 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step5", format: .photo, step: step)
                
                // Step 5 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 5b - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("5bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 5c - Income/voucher inputs
                ItemController.addNewItem(title: NSLocalizedString("5cTitle", comment: ""), text: NSLocalizedString("5cText", comment: ""), buttonText: NSLocalizedString("5cButtonText", comment: ""), url: NSLocalizedString("5cUrl", comment: ""), graphicName: NSLocalizedString("5cGraphicName", comment: ""), format: .dataInput, step: step)
                
                // Item 5d - Max rent amount
                ItemController.addNewItem(title: NSLocalizedString("5dTitle", comment: ""), text: NSLocalizedString("5dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 5e - How is this calculated
                ItemController.addNewItem(title: NSLocalizedString("5eTitle", comment: ""), text: NSLocalizedString("5eText", comment: ""), buttonText: nil, url: nil, graphicName: "addingMachine", format: .tip, step: step)
                
                // Item 5f - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("5fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 6
                
            case NSLocalizedString("STEP", comment: "") + " 6":
                
                // Item 6a - Map instructions
                ItemController.addNewItem(title: nil, text: NSLocalizedString("6aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 7
                
            case NSLocalizedString("STEP", comment: "") + " 7":
                
                // Step 7 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step7", format: .photo, step: step)
                
                // Step 7 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 7a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 7b - Chosen apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER, INCLUDING INDEXES)
                ItemController.addNewItem(title: NSLocalizedString("7bTitle", comment: ""), text: "", buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)

                // Item 7c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: nil, format: .apartmentPhoto, step: step)
                
                // Item 7d - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("7dTitle", comment: ""), text: NSLocalizedString("7dText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 7e - Maximum rent
                ItemController.addNewItem(title: NSLocalizedString("7eTitle", comment: ""), text: NSLocalizedString("7eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 7f - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("7fTitle", comment: ""), text: NSLocalizedString("7fText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 7g - Call button (IF ITEM KEY IS CHANGED, UPDATE CODE IN STEP DETAIL TVC CLICKLINK CELL DELEGATE EXTENSION)
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7gText", comment: ""), buttonText: NSLocalizedString("7gButtonText", comment: ""), url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7h - What if isn't right (IF ITEM KEY IS CHANGED, UPDATE CODE IN STEP DETAIL TVC CLICKLINK CELL DELEGATE EXTENSION)
                ItemController.addNewItem(title: NSLocalizedString("7hTitle", comment: ""), text: NSLocalizedString("7hText", comment: ""), buttonText: NSLocalizedString("7hButtonText", comment: ""), url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7i - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7iText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
            
            // MARK: - STEP 8
                
            case NSLocalizedString("STEP", comment: "") + " 8":
                
                // Step 8 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step8", format: .photo, step: step)
                
                // Step 8 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 8a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8b - Selected apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: NSLocalizedString("8bTitle", comment: ""), text: NSLocalizedString("8bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 8c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage", format: .apartmentPhoto, step: step)
                
                // Item 8d - List of four docs
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8e - Helpful hint
                ItemController.addNewItem(title: NSLocalizedString("8eTitle", comment: ""), text: NSLocalizedString("8eText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 8f - Tenancy approval
                ItemController.addNewItem(title: NSLocalizedString("8fTitle", comment: ""), text: NSLocalizedString("8fText", comment: ""), buttonText: NSLocalizedString("8fButtonText", comment: ""), url: "https://www.hud.gov/sites/documents/52517.PDF", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8g - W-9
                ItemController.addNewItem(title: NSLocalizedString("8gTitle", comment: ""), text: NSLocalizedString("8gText", comment: ""), buttonText: NSLocalizedString("8gButtonText", comment: ""), url: "http://housinguc.org/pdf/W-9Form.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8h - Cover letter
                ItemController.addNewItem(title: NSLocalizedString("8hTitle", comment: ""), text: NSLocalizedString("8hText", comment: ""), buttonText: NSLocalizedString("8hButtonText", comment: ""), url: "http://housinguc.org/pdf/W-9FormCoverLetter.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8i - Copy of proposed lease
                ItemController.addNewItem(title: NSLocalizedString("8iTitle", comment: ""), text: NSLocalizedString("8iText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8j - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("8jTitle", comment: ""), text: NSLocalizedString("8jText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 8k - Top to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8kText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 9
                
            case NSLocalizedString("STEP", comment: "") + " 9":
                
                // Step 9 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step9", format: .photo, step: step)
                
                // Step 9 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 9a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9b - Housing Authority office info
                ItemController.addNewItem(title: NSLocalizedString("9bTitle", comment: ""), text: NSLocalizedString("9bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 9c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 9d - After you deliver docs
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9e - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("9eTitle", comment: ""), text: NSLocalizedString("9eText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 9f - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 10
                
            case NSLocalizedString("STEP", comment: "") + " 10":
                
                // Step 10 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step10", format: .photo, step: step)
                
                // Step 10 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 10a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10b - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("10bTitle", comment: ""), text: NSLocalizedString("10bText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 10c - Talk to landlord and housing authority
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10d - Inspection date picker
                ItemController.addNewItem(title: NSLocalizedString("10dTitle", comment: ""), text: NSLocalizedString("10dText", comment: ""), buttonText: NSLocalizedString("10dButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 10e - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 11
                
            case NSLocalizedString("STEP", comment: "") + " 11":
                
                // Step 11 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step11", format: .photo, step: step)
                
                // Step 11 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 11a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 11b - Selected aparmentment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: NSLocalizedString("11bTitle", comment: ""), text: NSLocalizedString("11bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 11c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage", format: .apartmentPhoto, step: step)
                
                // Item 11d - If it doesn't pass
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)

                // Item 11e - If you need to reschedule
                ItemController.addNewItem(title: NSLocalizedString("11eTitle", comment: ""), text: NSLocalizedString("11eText", comment: ""), buttonText: nil, url: nil, graphicName: "calendar", format: .tip, step: step)
                
                // Item 11f - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 12
                
            case NSLocalizedString("STEP", comment: "") + " 12":
                
                // Step 12 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step12", format: .photo, step: step)
                
                // Step 12 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 12a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12b - Final appointment date picker
                ItemController.addNewItem(title: NSLocalizedString("12bTitle", comment: ""), text: NSLocalizedString("12bText", comment: ""), buttonText: NSLocalizedString("12bButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 12c - Don't forget appointment
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12d - Housing Authority office info
                ItemController.addNewItem(title: NSLocalizedString("12dTitle", comment: ""), text: NSLocalizedString("12dText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 12d - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 12e - At appointment
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12f - If you need to reschedule
                ItemController.addNewItem(title: NSLocalizedString("12fTitle", comment: ""), text: NSLocalizedString("12fText", comment: ""), buttonText: nil, url: nil, graphicName: "calendar", format: .tip, step: step)
                
                // Item 12g - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 13
                
            case NSLocalizedString("STEP", comment: "") + " 13":
                
                // Step 13 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step13", format: .photo, step: step)
                
                // Step 13 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 13a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("13aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 13b - Selected aparmentment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: NSLocalizedString("13bTitle", comment: ""), text: NSLocalizedString("13bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 13c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage", format: .photo, step: step)
                
                // Item 13d - Then return copies to HAUC
                ItemController.addNewItem(title: nil, text: NSLocalizedString("13dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 13e - Housing Authority office info
                ItemController.addNewItem(title: NSLocalizedString("13eTitle", comment: ""), text: NSLocalizedString("13eText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip
                    , step: step)
                
                // Item 13f - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 13g - When paperwork is processed & Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("13gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)

                
            // MARK: - STEP 14
                
            case NSLocalizedString("STEP", comment: "") + " 14":
                
                // Step 14 Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step14", format: .photo, step: step)
                
                // Step 14 Title
                ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 14a - Intro
                ItemController.addNewItem(title: nil, text: NSLocalizedString("14aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14b - Selected apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: NSLocalizedString("14bTitle", comment: ""), text: NSLocalizedString("14bText", comment: ""), buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 14c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage", format: .apartmentPhoto, step: step)
                
                // Item 14d - Recertification process
                ItemController.addNewItem(title: nil, text: NSLocalizedString("14dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14e - Important reminder
                ItemController.addNewItem(title: NSLocalizedString("14eTitle", comment: ""), text: NSLocalizedString("14eText", comment: ""), buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 14f - Tap to complete
                ItemController.addNewItem(title: nil, text: NSLocalizedString("14fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            default:
            return
            }
        }
    }
    
    // MARK: - STEP PERSISTENCE
    
    func persistCompletedSteps() {

        var completedStepsArray: [Bool] = []
        
        for step in steps {
            completedStepsArray.append(step.stepCompleted)
        }
        
        do {
            let apartmentJSON = try JSONEncoder().encode(completedStepsArray)
            try apartmentJSON.write(to: fileURL())
        } catch {
            print("FAILED TO PERSIST COMPLETED STEPS")
        }
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "CompletedSteps.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func loadCompletedSteps() {
        
        var completedSteps: [Bool] = []
        do {
            let stepJSON = try Data(contentsOf: fileURL())
            completedSteps = try JSONDecoder().decode([Bool].self, from: stepJSON)
            var stepIndex = 0
            for step in self.steps {
                step.stepCompleted = completedSteps[stepIndex]
                stepIndex += 1
            }
        } catch {
            print("FAILED TO LOAD PREVIOUSLY COMPLETED STEPS")
        }
    }
}

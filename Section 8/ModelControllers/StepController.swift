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
        
        let step1 = Step(name: "step1".localize, stepNumber: "STEP".localize + " 1", stepCompleted: false, homeImageName: "home1", stepImageName: "step1")
        let step2 = Step(name: "step2".localize, stepNumber: "STEP".localize + " 2", stepCompleted: false, homeImageName: "home2", stepImageName: "step2")
        let step3 = Step(name: "step3".localize, stepNumber: "STEP".localize + " 3", stepCompleted: false, homeImageName: "home3", stepImageName: "step3")
        let step4 = Step(name: "step4".localize, stepNumber: "STEP".localize + " 4", stepCompleted: false, homeImageName: "home4", stepImageName: "step4")
        let step5 = Step(name: "step5".localize, stepNumber: "STEP".localize + " 5", stepCompleted: false, homeImageName: "home5", stepImageName: "step5")
        let step6 = Step(name: "step6".localize, stepNumber: "STEP".localize + " 6", stepCompleted: false, homeImageName: "home6", stepImageName: "step6")
        let step7 = Step(name: "step7".localize, stepNumber: "STEP".localize + " 7", stepCompleted: false, homeImageName: "home7", stepImageName: "step7")
        let step8 = Step(name:  "step8".localize, stepNumber: "STEP".localize + " 8", stepCompleted: false, homeImageName: "home8", stepImageName: "step8")
        let step9 = Step(name: "step9".localize, stepNumber: "STEP".localize + " 9", stepCompleted: false, homeImageName: "home9", stepImageName: "step9")
        let step10 = Step(name: "step10".localize, stepNumber: "STEP".localize + " 10", stepCompleted: false, homeImageName: "home10", stepImageName: "step10")
        let step11 = Step(name: "step11".localize, stepNumber: "STEP".localize + " 11", stepCompleted: false, homeImageName: "home11", stepImageName: "step11")
        let step12 = Step(name: "step12".localize, stepNumber: "STEP".localize + " 12", stepCompleted: false, homeImageName: "home12", stepImageName: "step12")
        let step13 = Step(name: "step13".localize, stepNumber: "STEP 13", stepCompleted: false, homeImageName: "home13", stepImageName: "step13")
        let step14 = Step(name: "step14".localize, stepNumber: "STEP 14", stepCompleted: false, homeImageName: "home14", stepImageName: "step14")
        return [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14]
    }()
    
    // MARK: - ITEMS FUNCTION
    
    init() {
        addItemsToSteps()
    }
    
    func addItemsToSteps() {
        
        for step in steps {
            
            switch step.stepImageName {
            
            // MARK: - STEP 1
                
            case "step1":
                
            // Step 1 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step1", format: .photo, step: step)
            
            // Step 1 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 1a - Intro
                ItemController.addNewItem(title: nil, text: "1aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 1b - Viewing tip
                ItemController.addNewItem(title: "1bTitle".localize, text: "1bText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 1c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "onlineApplication", format: .photo, step: step)
                
                // Item 1d - Finished button
                ItemController.addNewItem(title: "1dTitle".localize, text: "1dText".localize, buttonText: nil, url: nil, graphicName: "return", format: .tip, step: step)
                
                // Item 1e - Online application
                ItemController.addNewItem(title: nil, text: "1eText".localize, buttonText: "1eButtonText".localize, url: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011", graphicName: nil, format: .clickLink, step: step)
                
                // Item 1f - Completed
                ItemController.addNewItem(title: nil, text: "1fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 2
                
            case "step2":
                
            // Step 2 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step2", format: .photo, step: step)
            
            // Step 2 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 2a - Intro
                ItemController.addNewItem(title: nil, text: "2aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2b - Housing office info
                ItemController.addNewItem(title: "2bTitle".localize, text: "2bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 2c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 2d - Waiting list paragraph
                ItemController.addNewItem(title: nil, text: "2dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2e - Waiting list tip
                ItemController.addNewItem(title: "2eTitle".localize, text: "2eText".localize, buttonText: nil, url: nil, graphicName: "waitingList", format: .tip, step: step)
                
                // Item 2f - Tap complete
                ItemController.addNewItem(title: nil, text: "2fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 3
            
            case "step3":
              
            // Step 3 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step3", format: .photo, step: step)
                
            // Step 3 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 3a - Intro
                ItemController.addNewItem(title: nil, text: "3aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3b - Appointment date picker
                ItemController.addNewItem(title: "3bTitle".localize, text: "3bText".localize, buttonText: "3bButtonText".localize, url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 3c - Read carefully
                ItemController.addNewItem(title: nil, text: "3cText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3d - Important reminder
                ItemController.addNewItem(title: "3dTitle".localize, text: "3dText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 3e - Here is address
                ItemController.addNewItem(title: nil, text: "3eText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3f - Housing office info
                ItemController.addNewItem(title: "3fTitle".localize, text: "3fText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 3g - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 3h - Tap complete
                ItemController.addNewItem(title: nil, text: "3hText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 4
                
            case "step4":
              
            // Step 4 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step4", format: .photo, step: step)
                
            // Step 4 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 4a - Intro
                ItemController.addNewItem(title: nil, text: "4aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4b - Housing office info
                ItemController.addNewItem(title: "4bTitle".localize, text: "4bText".localize, buttonText: nil, url: nil, graphicName: "phone", format: .tip, step: step)
                
                // Item 4c - Description of briefing
                ItemController.addNewItem(title: nil, text: "4cText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4d - Briefing date picker
                ItemController.addNewItem(title: "4dTitle".localize, text: "4dText".localize, buttonText: "4dButtonText".localize, url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 4e - If need to reschedule
                ItemController.addNewItem(title: nil, text: "4eText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4f - Important reminder
                ItemController.addNewItem(title: "4fTitle".localize, text: "4fText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 4g - Tap to complete
                ItemController.addNewItem(title: nil, text: "4gText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 5
                
            case "step5":
              
            // Step 5 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step5", format: .photo, step: step)
                
            // Step 5 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 5b - Intro
                ItemController.addNewItem(title: nil, text: "5bText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 5c - Income/voucher inputs
                ItemController.addNewItem(title: "5cTitle".localize, text: "5cText".localize, buttonText: "5cButtonText".localize, url: "5cUrl".localize, graphicName: "5cGraphicName".localize, format: .dataInput, step: step)
                
                // Item 5d - Max rent amount
                ItemController.addNewItem(title: "5dTitle".localize, text: "5dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 5e - How is this calculated
                ItemController.addNewItem(title: "5eTitle".localize, text: "5eText".localize, buttonText: nil, url: nil, graphicName: "addingMachine", format: .tip, step: step)
                
                // Item 5f - Tap to complete
                ItemController.addNewItem(title: nil, text: "5fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 6
                
            case "step6":
              
                // Item 6a - Map instructions
                ItemController.addNewItem(title: nil, text: "6aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 7
                
            case "step7":
          
            // Step 7 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step7", format: .photo, step: step)
                
            // Step 7 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 7a - Intro
                ItemController.addNewItem(title: nil, text: "7aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 7b - Chosen apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER, INCLUDING INDEXES)
                ItemController.addNewItem(title: "7bTitle".localize, text: "", buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 7c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: nil, format: .apartmentPhoto, step: step)
                
                // Item 7d - Important reminder
                ItemController.addNewItem(title: "7dTitle".localize, text: "7dText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 7e - Maximum rent
                ItemController.addNewItem(title: "7eTitle".localize, text: "7eText".localize, buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 7f - Important reminder
                ItemController.addNewItem(title: "7fTitle".localize, text: "7fText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 7g - Call button (IF ITEM KEY IS CHANGED, UPDATE CODE IN STEP DETAIL TVC CLICKLINK CELL DELEGATE EXTENSION)
                ItemController.addNewItem(title: nil, text: "7gText".localize, buttonText: "7gButtonText".localize, url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7h - What if isn't right (IF ITEM KEY IS CHANGED, UPDATE CODE IN STEP DETAIL TVC CLICKLINK CELL DELEGATE EXTENSION)
                ItemController.addNewItem(title: "7hTitle".localize, text: "7hText".localize, buttonText: "7hButtonText".localize, url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7i - Tap to complete
                ItemController.addNewItem(title: nil, text: "7iText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 8
                
            case "step8":
      
            // Step 8 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step8", format: .photo, step: step)
                
            // Step 8 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 8a - Intro
                ItemController.addNewItem(title: nil, text: "8aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8b - Selected apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: "8bTitle".localize, text: "8bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 8c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage".localize, format: .apartmentPhoto, step: step)
                
                // Item 8d - List of four docs
                ItemController.addNewItem(title: nil, text: "8dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8e - Helpful hint
                ItemController.addNewItem(title: "8eTitle".localize, text: "8eText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 8f - Tenancy approval
                ItemController.addNewItem(title: "8fTitle".localize, text: "8fText".localize, buttonText: "8fButtonText".localize, url: "https://www.hud.gov/sites/documents/52517.PDF", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8g - W-9
                ItemController.addNewItem(title: "8gTitle".localize, text: "8gText".localize, buttonText: "8gButtonText".localize, url: "http://housinguc.org/pdf/W-9Form.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8h - Cover letter
                ItemController.addNewItem(title: "8hTitle".localize, text: "8hText".localize, buttonText: "8hButtonText".localize, url: "http://housinguc.org/pdf/W-9FormCoverLetter.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8i - Copy of proposed lease
                ItemController.addNewItem(title: "8iTitle".localize, text: "8iText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8j - Important reminder
                ItemController.addNewItem(title: "8jTitle".localize, text: "8jText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 8k - Top to complete
                ItemController.addNewItem(title: nil, text: "8kText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 9

            case "step9":
      
            // Step 9 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step9", format: .photo, step: step)
                
            // Step 9 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 9a - Intro
                ItemController.addNewItem(title: nil, text: "9aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9b - Housing Authority office info
                ItemController.addNewItem(title: "9bTitle".localize, text: "9bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 9c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 9d - After you deliver docs
                ItemController.addNewItem(title: nil, text: "9dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9e - Important reminder
                ItemController.addNewItem(title: "9eTitle".localize, text: "9eText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 9f - Tap to complete
                ItemController.addNewItem(title: nil, text: "9fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 10
                
            case "step10":
      
            // Step 10 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step10", format: .photo, step: step)
                
            // Step 10 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 10a - Intro
                ItemController.addNewItem(title: nil, text: "10aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10b - Important reminder
                ItemController.addNewItem(title: "10bTitle".localize, text: "10bText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 10c - Talk to landlord and housing authority
                ItemController.addNewItem(title: nil, text: "10cText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10d - Inspection date picker
                ItemController.addNewItem(title: "10dTitle".localize, text: "10dText".localize, buttonText: "10dButtonText".localize, url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 10e - Tap to complete
                ItemController.addNewItem(title: nil, text: "10eText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 11
                
            case "step11":
      
            // Step 11 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step11", format: .photo, step: step)
                
            // Step 11 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 11a - Intro
                ItemController.addNewItem(title: nil, text: "11aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 11b - Selected aparmentment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: "11bTitle".localize, text: "11bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 11c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage".localize, format: .apartmentPhoto, step: step)
                
                // Item 11d - If it doesn't pass
                ItemController.addNewItem(title: nil, text: "11dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 11e - If you need to reschedule
                ItemController.addNewItem(title: "11eTitle".localize, text: "11eText".localize, buttonText: nil, url: nil, graphicName: "calendar", format: .tip, step: step)
                
                // Item 11f - Tap to complete
                ItemController.addNewItem(title: nil, text: "11fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 12
                
            case "step12":
      
            // Step 12 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step12", format: .photo, step: step)
                
            // Step 12 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 12a - Intro
                ItemController.addNewItem(title: nil, text: "12aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12b - Final appointment date picker
                ItemController.addNewItem(title: "12bTitle".localize, text: "12bText".localize, buttonText: "12bButtonText".localize, url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 12c - Don't forget appointment
                ItemController.addNewItem(title: nil, text: "12cText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12d - Housing Authority office info
                ItemController.addNewItem(title: "12dTitle".localize, text: "12dText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 12d - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 12e - At appointment
                ItemController.addNewItem(title: nil, text: "12eText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12f - If you need to reschedule
                ItemController.addNewItem(title: "12fTitle".localize, text: "12fText".localize, buttonText: nil, url: nil, graphicName: "calendar", format: .tip, step: step)
                
                // Item 12g - Tap to complete
                ItemController.addNewItem(title: nil, text: "12gText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 13
                
            case "step13":
      
            // Step 13 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step13", format: .photo, step: step)
                
            // Step 13 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 13a - Intro
                ItemController.addNewItem(title: nil, text: "13aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 13b - Selected aparmentment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: "13bTitle".localize, text: "13bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 13c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage".localize, format: .apartmentPhoto, step: step)
                
                // Item 13d - Then return copies to HAUC
                ItemController.addNewItem(title: nil, text: "13dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 13e - Housing Authority office info
                ItemController.addNewItem(title: "13eTitle".localize, text: "13eText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip
                    , step: step)
                
                // Item 13f - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 13g - When paperwork is processed & Tap to complete
                ItemController.addNewItem(title: nil, text: "13gText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 14
                
            case "step14":
            // Step 14 Photo
            ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "step14", format: .photo, step: step)
                
            // Step 14 Title
            ItemController.addNewItem(title: "\(step.stepNumber)", text: "\(step.name)", buttonText: nil, url: nil, graphicName: "\(step.homeImageName)", format: .title, step: step)
                
                // Item 14a - Intro
                ItemController.addNewItem(title: nil, text: "14aText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14b - Selected apartment (IF ITEM KEY IS CHANGED, UPDATE CODE IN SELECTED APARTMENT CONTROLLER)
                ItemController.addNewItem(title: "14bTitle".localize, text: "14bText".localize, buttonText: nil, url: nil, graphicName: "home", format: .tip, step: step)
                
                // Item 14c - Photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "noApartmentImage".localize, format: .apartmentPhoto, step: step)
                
                // Item 14d - Recertification process
                ItemController.addNewItem(title: nil, text: "14dText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14e - Important reminder
                ItemController.addNewItem(title: "14eTitle".localize, text: "14eText".localize, buttonText: nil, url: nil, graphicName: "lightbulb", format: .tip, step: step)
                
                // Item 14f - Tap to complete
                ItemController.addNewItem(title: nil, text: "14fText".localize, buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
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
    
    func refreshSteps() {
        
        let step1 = Step(name: "step1".localize, stepNumber: "STEP".localize + " 1", stepCompleted: false, homeImageName: "home1", stepImageName: "step1")
        let step2 = Step(name: "step2".localize, stepNumber: "STEP".localize + " 2", stepCompleted: false, homeImageName: "home2", stepImageName: "step2")
        let step3 = Step(name: "step3".localize, stepNumber: "STEP".localize + " 3", stepCompleted: false, homeImageName: "home3", stepImageName: "step3")
        let step4 = Step(name: "step4".localize, stepNumber: "STEP".localize + " 4", stepCompleted: false, homeImageName: "home4", stepImageName: "step4")
        let step5 = Step(name: "step5".localize, stepNumber: "STEP".localize + " 5", stepCompleted: false, homeImageName: "home5", stepImageName: "step5")
        let step6 = Step(name: "step6".localize, stepNumber: "STEP".localize + " 6", stepCompleted: false, homeImageName: "home6", stepImageName: "step6")
        let step7 = Step(name: "step7".localize, stepNumber: "STEP".localize + " 7", stepCompleted: false, homeImageName: "home7", stepImageName: "step7")
        let step8 = Step(name:  "step8".localize, stepNumber: "STEP".localize + " 8", stepCompleted: false, homeImageName: "home8", stepImageName: "step8")
        let step9 = Step(name: "step9".localize, stepNumber: "STEP".localize + " 9", stepCompleted: false, homeImageName: "home9", stepImageName: "step9")
        let step10 = Step(name: "step10".localize, stepNumber: "STEP".localize + " 10", stepCompleted: false, homeImageName: "home10", stepImageName: "step10")
        let step11 = Step(name: "step11".localize, stepNumber: "STEP".localize + " 11", stepCompleted: false, homeImageName: "home11", stepImageName: "step11")
        let step12 = Step(name: "step12".localize, stepNumber: "STEP".localize + " 12", stepCompleted: false, homeImageName: "home12", stepImageName: "step12")
        let step13 = Step(name: "step13".localize, stepNumber: "STEP".localize + " 13", stepCompleted: false, homeImageName: "home13", stepImageName: "step13")
        let step14 = Step(name: "step14".localize, stepNumber: "STEP".localize + " 14", stepCompleted: false, homeImageName: "home14", stepImageName: "step14")
        
        let steps = [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14]
        self.steps = steps
        addItemsToSteps()
        loadCompletedSteps()
    }
}

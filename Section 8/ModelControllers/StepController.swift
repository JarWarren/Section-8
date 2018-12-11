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
        
        let step1 = Step(name: NSLocalizedString("step1", comment: ""), stepNumber: NSLocalizedString("STEP", comment: "") + " 1", stepCompleted: false, homeImageName: "home1", stepImageName: "step1")
        let step2 = Step(name: NSLocalizedString("step2", comment: ""), stepNumber: "STEP 2", stepCompleted: false, homeImageName: "home2", stepImageName: "step2")
        let step3 = Step(name: NSLocalizedString("step3", comment: ""), stepNumber: "STEP 3", stepCompleted: false, homeImageName: "home3", stepImageName: "step3")
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
                
                // Item 1a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 1b
                ItemController.addNewItem(title: NSLocalizedString("1bTitle", comment: ""), text: NSLocalizedString("1bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1c - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "OnlineApplication", format: .photo, step: step)
                
                // Item 1d
                ItemController.addNewItem(title: NSLocalizedString("1dTitle", comment: ""), text: NSLocalizedString("1dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1eText", comment: ""), buttonText: NSLocalizedString("1eButtonText", comment: ""), url: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011", graphicName: nil, format: .clickLink, step: step)
                
                // Item 1f
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
            
                
            // MARK: - STEP 2
                
            case NSLocalizedString("STEP", comment: "") + " 2":
                
                // Item 2a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2b
                ItemController.addNewItem(title: NSLocalizedString("2bTitle", comment: ""), text: NSLocalizedString("2bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 2b - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 2c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2d
                ItemController.addNewItem(title: NSLocalizedString("2dTitle", comment: ""), text: NSLocalizedString("2dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 2e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 3
                
            case NSLocalizedString("STEP", comment: "") + " 3":
                
                // Item 3a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3b
                ItemController.addNewItem(title: NSLocalizedString("3bTitle", comment: ""), text: NSLocalizedString("3bText", comment: ""), buttonText: NSLocalizedString("3bButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 3c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3d
                ItemController.addNewItem(title: NSLocalizedString("3dTitle", comment: ""), text: NSLocalizedString("3dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 3e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3f
                ItemController.addNewItem(title: NSLocalizedString("3fTitle", comment: ""), text: NSLocalizedString("3fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 3f - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 3g
                ItemController.addNewItem(title: nil, text: NSLocalizedString("3gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
               
                
            // MARK: - STEP 4
                
            case NSLocalizedString("STEP", comment: "") + " 4":
                
                // Item 4a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4b
                ItemController.addNewItem(title: NSLocalizedString("4bTitle", comment: ""), text: NSLocalizedString("4bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 4c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4d
                ItemController.addNewItem(title: NSLocalizedString("4dTitle", comment: ""), text: NSLocalizedString("4dText", comment: ""), buttonText: NSLocalizedString("4dButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 4e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4f
                ItemController.addNewItem(title: NSLocalizedString("4fTitle", comment: ""), text: NSLocalizedString("4fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 4g
                ItemController.addNewItem(title: nil, text: NSLocalizedString("4gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 5
                
            case NSLocalizedString("STEP", comment: "") + " 5":
                
                // Item 5a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("5aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 5b
                ItemController.addNewItem(title: NSLocalizedString("5bTitle", comment: ""), text: NSLocalizedString("5bText", comment: ""), buttonText: NSLocalizedString("5bButtonText", comment: ""), url: NSLocalizedString("5bUrl", comment: ""), graphicName: NSLocalizedString("5bGraphicName", comment: ""), format: .dataInput, step: step)
                
                // Item 5c (RENT MAX LABEL NOT PROGRAMMED HERE!!!)
                ItemController.addNewItem(title: NSLocalizedString("5cTitle", comment: ""), text: NSLocalizedString("5cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 5d
                ItemController.addNewItem(title: NSLocalizedString("5dTitle", comment: ""), text: NSLocalizedString("5dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 5e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("5eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 6
                
            case NSLocalizedString("STEP", comment: "") + " 6":
                
                // Item 6a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("6aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
            // MARK: - STEP 7
                
            case NSLocalizedString("STEP", comment: "") + " 7":
                
                // Item 7a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 7b

                ItemController.addNewItem(title: NSLocalizedString("7bTitle", comment: ""), text: "", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)

                // Item 7b - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "DiamondFork", format: .photo, step: step)
                
                // Item 7c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 7d
                ItemController.addNewItem(title: NSLocalizedString("7dTitle", comment: ""), text: NSLocalizedString("7dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 7e
                ItemController.addNewItem(title: NSLocalizedString("7eTitle", comment: ""), text: NSLocalizedString("7eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .dataDisplay, step: step)
                
                // Item 7f
                ItemController.addNewItem(title: NSLocalizedString("7fTitle", comment: ""), text: NSLocalizedString("7fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 7g
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7gText", comment: ""), buttonText: NSLocalizedString("7gButtonText", comment: ""), url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7h
                ItemController.addNewItem(title: NSLocalizedString("7hTitle", comment: ""), text: NSLocalizedString("7hText", comment: ""), buttonText: NSLocalizedString("7hButtonText", comment: ""), url: nil, graphicName: nil, format: .clickLink, step: step)
                
                // Item 7i
                ItemController.addNewItem(title: nil, text: NSLocalizedString("7iText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
            
            // MARK: - STEP 8
                
            case NSLocalizedString("STEP", comment: "") + " 8":
                
                // Item 8a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8b (Selected apartment contact info)
                ItemController.addNewItem(title: NSLocalizedString("8bTitle", comment: ""), text: "Hill Family Apartments \n6015 W Oakshade Ln, West Jordan, UT 84081 \n801-417-3005", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 8c (Selected apartment photo) -- NEED TO INTERPOLATE SELECTED APARTMENT PHOTO
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HillHouse", format: .photo, step: step)
                
                // Item 8d (List of four forms)
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8e
                ItemController.addNewItem(title: NSLocalizedString("8eTitle", comment: ""), text: NSLocalizedString("8eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 8f
                ItemController.addNewItem(title: NSLocalizedString("8fTitle", comment: ""), text: NSLocalizedString("8fText", comment: ""), buttonText: NSLocalizedString("8fButtonText", comment: ""), url: "https://www.hud.gov/sites/documents/52517.PDF", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8g
                ItemController.addNewItem(title: NSLocalizedString("8gTitle", comment: ""), text: NSLocalizedString("8gText", comment: ""), buttonText: NSLocalizedString("8gButtonText", comment: ""), url: "http://housinguc.org/pdf/W-9Form.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8h
                ItemController.addNewItem(title: NSLocalizedString("8hTitle", comment: ""), text: NSLocalizedString("8hText", comment: ""), buttonText: NSLocalizedString("8hButtonText", comment: ""), url: "http://housinguc.org/pdf/W-9FormCoverLetter.pdf", graphicName: nil, format: .clickLink, step: step)
                
                // Item 8i
                ItemController.addNewItem(title: NSLocalizedString("8iTitle", comment: ""), text: NSLocalizedString("8iText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 8j
                ItemController.addNewItem(title: NSLocalizedString("8jTitle", comment: ""), text: NSLocalizedString("8jText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 8k
                ItemController.addNewItem(title: nil, text: NSLocalizedString("8kText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 9
                
            case NSLocalizedString("STEP", comment: "") + " 9":
                
                // Item 9a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9b
                ItemController.addNewItem(title: NSLocalizedString("9bTitle", comment: ""), text: NSLocalizedString("9bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 9b - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 9c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 9d
                ItemController.addNewItem(title: NSLocalizedString("9dTitle", comment: ""), text: NSLocalizedString("9dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 9e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("9eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 10
                
            case NSLocalizedString("STEP", comment: "") + " 10":
                
                // Item 10a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10b
                ItemController.addNewItem(title: NSLocalizedString("10bTitle", comment: ""), text: NSLocalizedString("10bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 10c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 10d
                ItemController.addNewItem(title: NSLocalizedString("10dTitle", comment: ""), text: NSLocalizedString("10dText", comment: ""), buttonText: NSLocalizedString("10dButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 10e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("10eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 11
                
            case NSLocalizedString("STEP", comment: "") + " 11":
                
                // Item 11a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 11b (Selected apartment contact info)
                ItemController.addNewItem(title: NSLocalizedString("11bTitle", comment: ""), text: "Hill Family Apartments \n6015 W Oakshade Ln, West Jordan, UT 84081 \n801-417-3005", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 11c (Selected apartment photo) -- NEED TO INTERPOLATE SELECTED APARTMENT PHOTO
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HillHouse", format: .photo, step: step)
                
                // Item 11d
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)

                // Item 11e
                ItemController.addNewItem(title: NSLocalizedString("11eTitle", comment: ""), text: NSLocalizedString("11eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 11f
                ItemController.addNewItem(title: nil, text: NSLocalizedString("11fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 12
                
            case NSLocalizedString("STEP", comment: "") + " 12":
                
                // Item 12a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12b
                ItemController.addNewItem(title: NSLocalizedString("12bTitle", comment: ""), text: NSLocalizedString("12bText", comment: ""), buttonText: NSLocalizedString("12bButtonText", comment: ""), url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 12c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12d
                ItemController.addNewItem(title: NSLocalizedString("12dTitle", comment: ""), text: NSLocalizedString("12dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 12d - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 12e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 12f
                ItemController.addNewItem(title: NSLocalizedString("12fTitle", comment: ""), text: NSLocalizedString("12fText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 12g
                ItemController.addNewItem(title: nil, text: NSLocalizedString("12gText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                
            // MARK: - STEP 13
                
            case NSLocalizedString("STEP", comment: "") + " 13":
                
                // Item 13a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("13aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 13b
                ItemController.addNewItem(title: NSLocalizedString("13bTitle", comment: ""), text: NSLocalizedString("13bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip
                    , step: step)
                
                // Item 13b - photo
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HAUCOffice", format: .photo, step: step)
                
                // Item 13c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("13cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)

                
            // MARK: - STEP 14
                
            case NSLocalizedString("STEP", comment: "") + " 14":
                
                // Item 14a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("14aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14b (Selected apartment contact info)
                ItemController.addNewItem(title: NSLocalizedString("11bTitle", comment: ""), text: "Hill Family Apartments \n6015 W Oakshade Ln, West Jordan, UT 84081 \n801-417-3005", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 14c (Selected apartment photo) -- NEED TO INTERPOLATE SELECTED APARTMENT PHOTO
                ItemController.addNewItem(title: nil, text: nil, buttonText: nil, url: nil, graphicName: "HillHouse", format: .photo, step: step)
                
                // Item 14d
                ItemController.addNewItem(title: nil, text: NSLocalizedString("14dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 14e
                ItemController.addNewItem(title: NSLocalizedString("14eTitle", comment: ""), text: NSLocalizedString("14eText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 14f
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

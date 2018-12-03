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
                
                // Item 1c
                ItemController.addNewItem(title: NSLocalizedString("1cTitle", comment: ""), text: NSLocalizedString("1cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1d
                ItemController.addNewItem(title: NSLocalizedString("1dTitle", comment: ""), text: NSLocalizedString("1dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1e
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1eText", comment: ""), buttonText: NSLocalizedString("1eButtonText", comment: ""), url: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011", graphicName: nil, format: .clickLink, step: step)
            
                
            // MARK: - STEP 2
                
            case NSLocalizedString("STEP", comment: "") + " 2":
                
                // Item 2a
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2aText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2b
                ItemController.addNewItem(title: NSLocalizedString("2bTitle", comment: ""), text: NSLocalizedString("2bText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 2c
                ItemController.addNewItem(title: nil, text: NSLocalizedString("2cText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2d
                ItemController.addNewItem(title: NSLocalizedString("2dTitle", comment: ""), text: NSLocalizedString("2dText", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                
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
            
            
            default:
            return
            }
        }
    }
}

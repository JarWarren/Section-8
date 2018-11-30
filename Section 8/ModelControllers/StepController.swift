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
        
        let step1 = Step(name: "Complete online application", stepNumber: "STEP 1", stepCompleted: false, homeImageName: "home1", stepImageName: "step1")
        let step2 = Step(name: "Photo ID & Social Security Card", stepNumber: "STEP 2", stepCompleted: false, homeImageName: "home2", stepImageName: "step2")
        let step3 = Step(name: "Complete mailed application", stepNumber: "STEP 3", stepCompleted: false, homeImageName: "home3", stepImageName: "step3")
        let step4 = Step(name: "Attend briefing", stepNumber: "STEP 4", stepCompleted: false, homeImageName: "home4", stepImageName: "step4")
        let step5 = Step(name: "Calculate rent payment", stepNumber: "STEP 5", stepCompleted: false, homeImageName: "home5", stepImageName: "step5")
        let step6 = Step(name: "Choose apartment", stepNumber: "STEP 6", stepCompleted: false, homeImageName: "home6", stepImageName: "step6")
        let step7 = Step(name: "Landlord signs request form", stepNumber: "STEP 7", stepCompleted: false, homeImageName: "home7", stepImageName: "step7")
        let step8 = Step(name: "Return request form to HAUC", stepNumber: "STEP 8", stepCompleted: false, homeImageName: "home8", stepImageName: "step8")
        let step9 = Step(name: "Schedule inspection", stepNumber: "STEP 9", stepCompleted: false, homeImageName: "home9", stepImageName: "step9")
        let step10 = Step(name: "Apartment inspection", stepNumber: "STEP 10", stepCompleted: false, homeImageName: "home10", stepImageName: "step10")
        let step11 = Step(name: "Landlord signs lease", stepNumber: "STEP 11", stepCompleted: false, homeImageName: "home11", stepImageName: "step11")
        let step12 = Step(name: "Return lease to HAUC", stepNumber: "STEP 12", stepCompleted: false, homeImageName: "home12", stepImageName: "step12")
        let step13 = Step(name: "Lease mailed back", stepNumber: "STEP 13", stepCompleted: false, homeImageName: "home13", stepImageName: "step13")
        let step14 = Step(name: "Time to move in!", stepNumber: "STEP 14", stepCompleted: false, homeImageName: "home14", stepImageName: "step14")
        
        return [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14]
    }()
    
    // MARK: - ITEMS FUNCTION
    
    init() {
        addItemsToSteps()
    }
    
    func addItemsToSteps() {
        
        for step in steps {
            switch step.stepNumber {
            case "STEP 1":
                // Item 1A
                ItemController.addNewItem(title: nil, text: "(Paragraph 1A text) Fill out the preliminary application by clicking the button below, but read these instructions first:", format: .paragraph, step: step)
                // Item 1B
                ItemController.addNewItem(title: "VIEWING TIP", text: "Tip 1B text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .tip, step: step)
                // Item 1C
                ItemController.addNewItem(title: "TIP 1C TITLE", text: "Tip 1C text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words.", format: .tip, step: step)
                // Item 1D
                ItemController.addNewItem(title: nil, text: "Paragraph 1D text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words.", format: .paragraph, step: step)
            case "STEP 2":
                // Item 2A
                ItemController.addNewItem(title: nil, text: "Paragraph 2A text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .paragraph, step: step)
                // Item 2B
                ItemController.addNewItem(title: nil, text: "Paragraph 2B text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .paragraph, step: step)
                // Item 2C
                ItemController.addNewItem(title: "TIP 2C TITLE", text: "Tip 2C text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words.", format: .tip, step: step)
                // Item 2D
                ItemController.addNewItem(title: nil, text: "Paragraph 2D text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .paragraph, step: step)
            case "STEP 3":
                // Item 3A
                ItemController.addNewItem(title: nil, text: "Paragraph 3A text. This text is extremely important.", format: .paragraph, step: step)
                // Item 3B
                ItemController.addNewItem(title: nil, text: "Paragraph 3B text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .paragraph, step: step)
                // Item 3C
                ItemController.addNewItem(title: nil, text: "Paragraph 3C text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words.", format: .paragraph, step: step)
                // Item 3D
                ItemController.addNewItem(title: "TIP 3D TITLE", text: "Tip 3D text. This text is extremely important. Jared and Ivan should make sure to memorize all of these words, and they should chant them to themselves three times each night before they go to sleep.", format: .tip, step: step)
            default:
            return
            }
        }
    }
}

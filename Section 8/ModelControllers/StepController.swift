//
//  StepController.swift
//  Section 8
//
//  Created by Arkin Hill on 11/28/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class StepController {
    
    // Source of truth
    static var steps: [Step] {
        
        let step1 = Step(name: "Complete online application", stepNumber: "STEP 1", stepCompleted: false, homeImageName: "home1")
        let step2 = Step(name: "Photo ID & Social Security Card", stepNumber: "STEP 2 ", stepCompleted: false, homeImageName: "home2")
        let step3 = Step(name: "Complete full application", stepNumber: "STEP 3", stepCompleted: false, homeImageName: "home3")
        let step4 = Step(name: "Attend briefing", stepNumber: "STEP 4", stepCompleted: false, homeImageName: "home4")
        let step5 = Step(name: "Calculate rent payment", stepNumber: "STEP 5", stepCompleted: false, homeImageName: "home5")
        let step6 = Step(name: "Choose apartment", stepNumber: "STEP 6", stepCompleted: false, homeImageName: "home6")
        let step7 = Step(name: "Landlord signs request form", stepNumber: "STEP 7", stepCompleted: false, homeImageName: "home7")
        let step8 = Step(name: "Return request form to HAUC", stepNumber: "STEP 8", stepCompleted: false, homeImageName: "home8")
        let step9 = Step(name: "Schedule inspection", stepNumber: "STEP 9", stepCompleted: false, homeImageName: "home9")
        let step10 = Step(name: "Apartment inspection", stepNumber: "STEP 10", stepCompleted: false, homeImageName: "home10")
        let step11 = Step(name: "Landlord signs lease", stepNumber: "STEP 11", stepCompleted: false, homeImageName: "home11")
        let step12 = Step(name: "Return lease to HAUC", stepNumber: "STEP 12", stepCompleted: false, homeImageName: "home12")
        let step13 = Step(name: "Lease mailed back", stepNumber: "STEP 13", stepCompleted: false, homeImageName: "home13")
        let step14 = Step(name: "Time to move in!", stepNumber: "STEP 14", stepCompleted: false, homeImageName: "home14")
        
        return [step1, step2, step3, step4, step5, step6, step7, step8, step9, step10, step11, step12, step13, step14]
    }
}

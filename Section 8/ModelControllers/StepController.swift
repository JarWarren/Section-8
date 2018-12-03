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
            
            case NSLocalizedString("STEP", comment: "") + " 1":
                
                // Item 1A
                ItemController.addNewItem(title: nil, text: NSLocalizedString("1a", comment: ""), buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 1B
                ItemController.addNewItem(title: "VIEWING TIP", text: "It might be easier to turn your phone sideways, so the application is easier to read.", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1C
                ItemController.addNewItem(title: "APPLICATION RECEIPT", text: "When finished, you will see an “Application Receipt” screen. Take a screenshot and save it.", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1D
                ItemController.addNewItem(title: "FINISHED BUTTON", text: "Finally, click on the “Finished” button near the bottom of the screen, and return to this page.", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 1E
                ItemController.addNewItem(title: nil, text: "(1E) When you’re ready, click here to be taken to the online application on the HAUC website:", buttonText: "PRELIMINARY APPLICATION", url: "https://www.waitlistcheck.com/application/form.php?ID=972-UT011", graphicName: nil, format: .clickLink, step: step)
                
                
            case "STEP 2":
                
                // Item 2A
                ItemController.addNewItem(title: nil, text: "After submitting your preliminary application online, the head of household takes a photo ID and social security card to the Housing Authority of Utah County (HAUC) main office.", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2B
                ItemController.addNewItem(title: "HOUSING AUTHORITY (HAUC) OFFICE INFORMATION", text: "240 E Center St \nProvo, UT 84606 \nHours: Monday – Thursday, 7:30am to 5:30pm \nPhone: 801-373-8333", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 2C
                ItemController.addNewItem(title: nil, text: "Once the head of household has taken these two forms of identification in to the HAUC office, this step is complete!", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 2D
                ItemController.addNewItem(title: "WAITING LIST", text: "Once you have completed this step, you will be placed on a waiting list, and the wait time is from TWO MONTHS up to MORE THAN A YEAR. \n\nBe patient, and make sure to update your phone number and mailing address with the Housing Authority if anything changes!", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
            
            case "STEP 3":
                
                // Item 3A
                ItemController.addNewItem(title: nil, text: "When your name reaches the top of the waiting list, you will receive a full application in the mail. Along with that application you will receive an appointment date to bring in your application to the HAUC main office:", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3B
                ItemController.addNewItem(title: "APPOINTMENT DATE", text: "Please enter your appointment date here, so we can send you a reminder notification:", buttonText: "SET APPOINTMENT DATE", url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 3C
                ItemController.addNewItem(title: nil, text: "Read the application carefully, and complete each section. Be sure to update household and income verification. \n\nWhen you go to your appointment, you will bring the complete application, along with income verifications, birth certificates, and Social Security Cards for everyone in the household.", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 3D
                ItemController.addNewItem(title: "APPLICATION APPOINTMENT", text: "Once you have taken your application, income verifications, birth certificates and Social Security Cards to your appointment, and the HAUC has let you know the application is complete, you have completed this step! \n\nIn the next several days, a briefing will be scheduled for you.", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
            case "STEP 4":
                
                // Item 4A
                ItemController.addNewItem(title: nil, text: "You should receive an invitation to attend a briefing several days after your application appointment. If you don’t, call the HAUC office to find out when you can come to a briefing.", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4B
                ItemController.addNewItem(title: "HAUC OFFICE INFORMATION", text: "Hours: Monday – Thursday, 7:30am to 5:30pm \nPhone: 801-373-8333", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
                
                // Item 4C
                ItemController.addNewItem(title: nil, text: "In the briefing, program procedures are explained, and you will be taught how to begin receiving assistance.", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4D
                ItemController.addNewItem(title: "BRIEFING DATE", text: "Please enter your briefing date here, so we can send you a reminder notification:", buttonText: "SET BRIEFING DATE", url: nil, graphicName: nil, format: .datePicker, step: step)
                
                // Item 4E
                ItemController.addNewItem(title: nil, text: "Once you have attended the briefing, you only have 60 days to find a place to live, and to complete the remaining steps in this app.", buttonText: nil, url: nil, graphicName: nil, format: .paragraph, step: step)
                
                // Item 4F
                ItemController.addNewItem(title: "BRIEFING APPOINTMENT", text: "Once you have attended your briefing, you have completed this step! \n\nYou will be reminded weekly how much time you have left to find an apartment and completed the remaining steps.", buttonText: nil, url: nil, graphicName: nil, format: .tip, step: step)
            
            
            default:
            return
            }
        }
    }
}

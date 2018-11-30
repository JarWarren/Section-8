//
//  ItemController.swift
//  Section 8
//
//  Created by Arkin Hill on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class ItemController {
    
    static func addNewItem(title: String?, text: String, buttonText: String? = nil, format: ItemFormat, step: Step) {
        let newItem = Item(title: title, text: text, buttonText: buttonText, format: format)
        step.items.append(newItem)
    }
}




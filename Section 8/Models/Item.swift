//
//  Item.swift
//  Section 8
//
//  Created by Arkin Hill on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class Item {
    
    var title: String?
    let text: String
    let buttonText: String?
    let datePicker: Date?
    let format: ItemFormat
    
    init(title: String?, text: String, buttonText: String? = nil, datePicker: Date? = nil, format: ItemFormat) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.datePicker = datePicker
        self.format = format
    }
}

// MARK: - FORMAT TYPE

enum ItemFormat: String {
    case tip = "tip"
    case paragraph = "paragraph"
    case paragraphWithButton = "paragraphWithButton"
    case datePicker = "datePicker"
}

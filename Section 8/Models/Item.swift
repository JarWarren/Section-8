//
//  Item.swift
//  Section 8
//
//  Created by Arkin Hill on 11/29/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation

class Item: Codable {
    
    var title: String?
    let text: String?
    let buttonText: String?
    let url: String?
    let graphicName: String?
    let format: ItemFormat
    
    init(title: String?, text: String?, buttonText: String?, url: String?, graphicName: String?, format: ItemFormat) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.url = url
        self.graphicName = graphicName
        self.format = format
    }
}

// MARK: - FORMAT TYPE

enum ItemFormat: String, Codable {
    case clickLink = "clickLink"
    case dataDisplay = "datadisplay"
    case dataInput = "dataInput"
    case datePicker = "datePicker"
    case paragraph = "paragraph"
    case tip = "tip"
}

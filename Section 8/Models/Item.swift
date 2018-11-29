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
    let format: ItemFormat
    
    init(title: String?, text: String, format: ItemFormat) {
        self.title = title
        self.text = text
        self.format = format
    }
}

// MARK: - FORMAT TYPE

enum ItemFormat: String {
    case tip = "tip"
    case paragraph = "paragraph"
}

//
//  Alarm.swift
//  Section 8
//
//  Created by Ivan Ramirez on 12/4/18.
//  Copyright © 2018 Warren. All rights reserved.
//

import Foundation


class Alarm: Codable {
    var fireDate: Date
    var name: String
    var isOn: Bool
    var uuid: String
    
    init(fireDate: Date, name: String, isOn: Bool = true, uuid: String = UUID().uuidString) {
        self.fireDate = fireDate
        self.name = name
        self.isOn = isOn
        self.uuid = uuid
    }
    
    var fireDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: fireDate)
    }
}

extension Alarm: Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.name != rhs.name && lhs.fireDate != rhs.fireDate {return false}
        return true 
    }
}

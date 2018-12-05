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
    var isOn: Bool
    var uuid: String
    
    init(fireDate: Date, isOn: Bool = true, uuid: String = UUID().uuidString) {
        self.fireDate = fireDate
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

extension Alarm {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.uuid != rhs.uuid {return false}
        return true 
    }
}

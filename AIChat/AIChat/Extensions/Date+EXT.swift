//
//  Date+EXT.swift
//  AIChat
//
//  Created by Morse on 1/26/25.
//

import Foundation

// Extension to Date to add time more intuitively
extension Date {
    func addingTimeInterval(days: Int = 0, hours: Int = 0, minutes: Int = 0) -> Date {
        let secondsInDay: TimeInterval = 60 * 60 * 24
        let secondsInHour: TimeInterval = 60 * 60
        let secondsInMinute: TimeInterval = 60
        
        let totalTimeInterval = TimeInterval(days * Int(secondsInDay) + hours * Int(secondsInHour) + minutes * Int(secondsInMinute))
        return self.addingTimeInterval(totalTimeInterval)
    }
}

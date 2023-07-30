//
//  Date+Extension.swift
//  NoSnooze
//
//  Created by Miguel Chavez on 7/28/23.
//

import Foundation

extension Date {
    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
    
    func makeDateWithZeroSeconds() -> Date {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        if let dateWithZeroSeconds = calendar.date(from: dateComponents) {
            return dateWithZeroSeconds
        }
        return self
    }
}

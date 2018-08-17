//
//  Date+.swift
//  Copyright © 2018 James Kuczmarski. All rights reserved.
//

import Foundation

extension Date {
    /**
        Add Calendar component to date

        var date = Date()          // Aug 17, 2018 7:12pm
        date.add(.day, value 10)   // Aug 17, 2018 7:22pm
        date.add(.month, value -2) // Jun 17, 2018 7:22pm
    */
    public mutating func add(_ component: Calendar.Component, value: Int) {
        if let date = Calendar.current.date(byAdding: component, value: value, to: self) {
            self = date
        }
    }
}
//
//  UIColor+.swift
//  Copyright © 2018 James Kuczmarski. All rights reserved.
//

import UIKit

extension UIColor {
    /**
        Initializes and returns a UIColor object using the specified hex and opacity values

        - parameter hex: A hex color string representing the color value
        - parameter alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0

        - returns: UIColor object
    */
    convenience public init(hex h: String, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        if h.hasPrefix("#") {
            
            // index of first character after #
            let index = h.index(after: h.startIndex)
            // get hex digits
            let hex = String(h[index...])
            let scanner = Scanner(string: hex)
            var hexValue: CUnsignedLongLong = 0
            
            if scanner.scanHexInt64(&hexValue) {
                switch (hex.count) {
                    case 3:
                        red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                        green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                        blue  = CGFloat(hexValue & 0x00F)              / 15.0
                        
                    case 4:
                        red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                        green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                        blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                        
                    case 6:
                        red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                        green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                        blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
                        
                    case 8:
                        red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                        green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                        blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                        
                    default:
                        fatalError("Invalid hex string, number of characters after '#' should be either 3, 4, 6 or 8")
                }
            } else {
                fatalError("Scan hex error \(h)")
            }
        } else {
            fatalError("Invalid hex string: missing '#'")
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}


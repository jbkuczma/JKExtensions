//
//  UIView+.swift
//  Copyright © 2018 James Kuczmarski. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
     Direction of the linear gradient
     
     - Vertical:                            Linear gradient vertical
     - Horizontal:                          Linear gradient horizontal
     - DiagonalFromLeftToRightAndTopToDown: Linear gradient from left to right and top to down
     - DiagonalFromLeftToRightAndDownToTop: Linear gradient from left to right and down to top
     - DiagonalFromRightToLeftAndTopToDown: Linear gradient from right to left and top to down
     - DiagonalFromRightToLeftAndDownToTop: Linear gradient from right to left and down to top
     */
    public enum UIViewLinearGradientDirection : Int {
        case Vertical
        case Horizontal
        case DiagonalFromLeftToRightAndTopToDown
        case DiagonalFromLeftToRightAndDownToTop
        case DiagonalFromRightToLeftAndTopToDown
        case DiagonalFromRightToLeftAndDownToTop
    }
    
    /**
     Create a linear gradient
     
     - parameter colors:    Array of UIColor instances
     - parameter direction: Direction of the gradient
     */
    public func createGradientWithColors(colors: Array<UIColor>, direction: UIViewLinearGradientDirection) {

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "gradient"
        gradient.frame = self.bounds

        var cgColors: [CGColor] = []
        
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        gradient.colors = cgColors
        switch direction {
            case .Vertical:
                
                gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
            
            case .Horizontal:
                gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            case .DiagonalFromLeftToRightAndTopToDown:
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            
            case .DiagonalFromLeftToRightAndDownToTop:
                gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
            
            case .DiagonalFromRightToLeftAndTopToDown:
                gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            
            case .DiagonalFromRightToLeftAndDownToTop:
                gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
                gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        }

        self.layer.insertSublayer(gradient, at:0)  
    }
}

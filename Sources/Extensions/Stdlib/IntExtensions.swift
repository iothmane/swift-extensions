//
//  IntExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension Int {

    /// Radian value of degree input.
    var degreesToRadians: Double {
        return Double.pi * Double(self) / 180.0
    }

    /// Degree value of radian input.
    var radiansToDegrees: Double {
        return Double(self) * 180 / Double.pi
    }

    /// Int to UInt.
    var uInt: UInt {
        return UInt(self)
    }

    /// Int to Double.
    var double: Double {
        return Double(self)
    }

    /// Int to Float.
    var float: Float {
        return Float(self)
    }

    #if canImport(CoreGraphics)
    /// Int to CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif
}

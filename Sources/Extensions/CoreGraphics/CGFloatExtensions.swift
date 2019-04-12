//
//  CGFloatExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import CoreGraphics

// MARK: - Properties
public extension CGFloat {

    /// Absolute of CGFloat value.
    var abs: CGFloat {
        return Swift.abs(self)
    }

    /// Ceil of CGFloat value.
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }

    /// Radian value of degree input.
    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }

    /// SwifterSwift: Degree value of radian input.
    var radiansToDegrees: CGFloat {
        return self * 180 / CGFloat.pi
    }

    /// Floor of CGFloat value.
    var floor: CGFloat {
        return Foundation.floor(self)
    }

    /// Check if CGFloat is positive.
    var isPositive: Bool {
        return self > 0
    }

    /// Check if CGFloat is negative.
    var isNegative: Bool {
        return self < 0
    }

    /// CGFloat to Int.
    var int: Int {
        return Int(self)
    }

    /// CGFloat to Float.
    var float: Float {
        return Float(self)
    }

    /// CGFloat to Double.
    var double: Double {
        return Double(self)
    }
}

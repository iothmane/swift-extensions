//
//  FloatingPointExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Properties
public extension FloatingPoint {

    /// Absolute value of number.
    var abs: Self {
        return Swift.abs(self)
    }

    /// Check if number is positive.
    var isPositive: Bool {
        return self > 0
    }

    /// Check if number is negative.
    var isNegative: Bool {
        return self < 0
    }

    #if canImport(Foundation)
    /// Ceil of number.
    var ceil: Self {
        return Foundation.ceil(self)
    }
    #endif

    #if canImport(Foundation)
    /// Floor of number.
    var floor: Self {
        return Foundation.floor(self)
    }
    #endif

    /// Radian value of degree input.
    var degreesToRadians: Self {
        return Self.pi * self / Self(180)
    }

    /// Degree value of radian input.
    var radiansToDegrees: Self {
        return self * Self(180) / Self.pi
    }
}

//
//  FloatExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Properties
public extension Float {

    /// Float to Int.
    var int: Int {
        return Int(self)
    }

    /// Float to Double.
    var double: Double {
        return Double(self)
    }

    #if canImport(CoreGraphics)
    //// Float to CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif
}

//
//  DoubleExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Properties
public extension Double {

    /// Double to Int.
    var int: Int {
        return Int(self)
    }

    /// Double to Float.
    var float: Float {
        return Float(self)
    }

    #if canImport(CoreGraphics)
    /// Double to CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif
}

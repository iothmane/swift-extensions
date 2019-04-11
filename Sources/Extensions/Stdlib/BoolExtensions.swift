//
//  BoolExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Properties
public extension Bool {

    /// Return the Int representation of the bool value
    var int: Int {
        return self ? 1 : 0
    }

    /// Return the String representation of the bool value
    var string: String {
        return self ? "true" : "false"
    }
}

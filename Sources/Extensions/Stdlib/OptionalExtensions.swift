//
//  OptionalExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Methods
public extension Optional {

    /// Get self or the default value (if self is nil)
    ///
    /// - Parameter defaultValue: the value to return if self is nil
    /// - Returns: self if not nil or default value if nil
    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }
}

// MARK: - Methods (Collection)
public extension Optional where Wrapped: Collection {

    /// Check if optional is nil or empty collection.
    var isNilOrEmpty: Bool {
        guard let collection = self else { return true }
        return collection.isEmpty
    }

    /// Returns the collection only if it is not nil and not empty.
    var nonEmpty: Wrapped? {
        guard let collection = self else { return nil }
        guard !collection.isEmpty else { return nil }
        return collection
    }
}

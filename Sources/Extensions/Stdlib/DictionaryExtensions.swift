//
//  DictionaryExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: - Methods
public extension Dictionary {

    /// Check if key exists in dictionary.
    ///
    ///        let dict: [String : Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    ///        dict.has(key: "testKey") -> true
    ///        dict.has(key: "anotherKey") -> false
    ///
    /// - Parameter key: key to search for
    /// - Returns: true if key exists in dictionary.
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }

    #if canImport(Foundation)
    /// JSON String from dictionary.
    ///
    ///        dict.jsonString() -> "{"testKey":"testValue","testArrayKey":[1,2,3,4,5]}"
    ///        dict.jsonString(pretty: true) ->
    ///
    ///        "{
    ///             "testKey" : "testValue",
    ///             "testArrayKey" : [
    ///                 1,
    ///                 2,
    ///                 3,
    ///                 4,
    ///                 5
    ///             ]
    ///        }"
    ///
    /// - Parameter pretty: option that uses white space and indentation to make the output more readable.
    /// - Returns: optional JSON String.
    func jsonString(pretty: Bool = false) -> String? {
        guard JSONSerialization.isValidJSONObject(self) else { return nil }
        let options = (pretty == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: options)
            else { return nil }
        return String(data: jsonData, encoding: .utf8)
    }
    #endif
}

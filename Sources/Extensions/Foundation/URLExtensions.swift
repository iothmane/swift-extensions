//
//  URLExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import Foundation

// MARK: - Properties
public extension URL {

    /// Dictionary of the URL's query parameters
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false), let queryItems = components.queryItems else { return nil }

        var items: [String: String] = [:]

        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }

        return items
    }
}

// MARK: - Initializers
extension URL {

    /// Initializer that creates URLs that are hard-coded
    ///
    /// To open for example a web url with a Safari VC, we can simply pass
    /// the string to the initializer without the need to unwrap it first:
    ///
    ///     let url = URL(staticString: "https://apple.com/")
    ///     SFSafariViewController(url: url)
    ///
    /// - Parameter string: The hard coded url we want to open
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }
        self = url
    }
}

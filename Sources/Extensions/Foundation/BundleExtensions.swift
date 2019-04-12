//
//  BundleExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import Foundation

extension Bundle {

    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }

    var prettyVersionString: String {
        guard let version = versionNumber,
            let build = buildNumber else {
                return "-"
        }
        return "Version \(version) (\(build))"
    }
}

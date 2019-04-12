//
//  CLLocationExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import CoreLocation

// MARK: - Methods
public extension CLLocation {

    /// Calculates the bearing to another CLLocation.
    ///
    /// - Parameter destination: Location to calculate bearing.
    /// - Returns: Calculated bearing degrees in the range 0° ... 360°
    func bearing(to destination: CLLocation) -> Double {
        // http://stackoverflow.com/questions/3925942/cllocation-category-for-calculating-bearing-w-haversine-function
        let lat1 = Double.pi * coordinate.latitude / 180.0
        let long1 = Double.pi * coordinate.longitude / 180.0
        let lat2 = Double.pi * destination.coordinate.latitude / 180.0
        let long2 = Double.pi * destination.coordinate.longitude / 180.0

        // Formula: θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
        // Source: http://www.movable-type.co.uk/scripts/latlong.html

        let rads = atan2(
            sin(long2 - long1) * cos(lat2),
            cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(long2 - long1))
        let degrees = rads * 180 / Double.pi

        return (degrees + 360).truncatingRemainder(dividingBy: 360)
    }

    // MARK: Permissions helpers

    static func serviceEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }

    static func authorizationGranted() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways
    }

    static func authorizationNotDetermined() -> Bool {
        return CLLocationManager.authorizationStatus() == .notDetermined
    }

    static func authorizationDenied() -> Bool {
        return CLLocationManager.authorizationStatus() == .denied
    }

    static func authorizationRestricted() -> Bool {
        return CLLocationManager.authorizationStatus() == .restricted
    }
}

//
//  CLPlacemarkExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import CoreLocation

extension CLPlacemark {

    /// Formatted address computed from the placemark properties
    var formattedAddress: String {
        var address = ""

        if let subThoroughfare = subThoroughfare, let thoroughfare = thoroughfare {
            address += "\(subThoroughfare) \(thoroughfare)"
        } else if let name = name {
            address += name
        }

        if let locality = locality {
            address += ", \(locality)"
        }

        if let administrativeArea = administrativeArea {
            address += ", \(administrativeArea)"
        }

        if let postalCode = postalCode {
            address += " \(postalCode)"
        }

        if let country = country {
            address += ", \(country)"
        }

        return address
    }
}

extension CLLocationCoordinate2D {

    var areValid: Bool {
        return latitude != 0 && longitude != 0
    }
}

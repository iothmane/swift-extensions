//
//  UIColorExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-03-27.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

import UIKit

// MARK: - Properties
public extension UIColor {

    /// Return a random color
    static var random: UIColor? {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return UIColor(red: red, green: green, blue: blue)
    }

    /// Alpha value of a color (read-only)
    var alpha: CGFloat {
        return cgColor.alpha
    }

    /// A default dimmed color, usually used for selected states colors
    var dimmed: UIColor {
        return darken(by: 0.6)
    }
}

// MARK: - Methods
public extension UIColor {

    /// Lighten a color
    ///
    ///     let red = UIColor.red
    ///     let lighterRed = red.lighten(by: 0.5)
    ///
    /// - Parameter percentage: The percentage by which to lighten the color
    /// - Returns: A lightened color
    func lighten(by percentage: CGFloat = 0.4) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return UIColor(red: min(red + percentage, 1.0),
                       green: min(green + percentage, 1.0),
                       blue: min(blue + percentage, 1.0),
                       alpha: alpha)
    }

    /// Darken a color
    ///
    ///     let red = UIColor.red
    ///     let darkerRed = red.darken(by: 0.5)
    ///
    /// - Parameter percentage: The percentage by which to darken the color
    /// - Returns: A darkened color
    func darken(by percentage: CGFloat = 0.4) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return UIColor(red: max(red - percentage, 0),
                       green: max(green - percentage, 0),
                       blue: max(blue - percentage, 0),
                       alpha: alpha)
    }
}

// MARK: - Initializers
public extension UIColor {

    /// Create a UIColor from RGB values with optional transparency
    ///
    /// - Parameters:
    ///   - red: red component
    ///   - green: green component
    ///   - blue: blue component
    ///   - alpha: optional alpha value (default is 1)
    convenience init?(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
        guard red >= 0 && red <= 255 else { return nil }
        guard green >= 0 && green <= 255 else { return nil }
        guard blue >= 0 && blue <= 255 else { return nil }

        var transparency = alpha
        if transparency < 0 { transparency = 0 }
        if transparency > 1 { transparency = 1 }

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: transparency)
    }

    /// Create a UIColor from HEX value
    ///
    /// - Parameter hex: hexadecimal string (examples: #1ABC9C, 2C3E50, FFC0392B)
    convenience init?(hex: String) {

        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanedHex = cleanedHex.replacingOccurrences(of: "#", with: "")
        let length = cleanedHex.count

        var rgb: UInt32 = 0
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 1.0

        guard Scanner(string: cleanedHex).scanHexInt32(&rgb) else { return nil }

        if length == 6 {
            red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            red = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return nil
        }

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

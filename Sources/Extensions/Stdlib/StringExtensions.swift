//
//  StringExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

#if canImport(UIKit)
import UIKit
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#endif

// MARK: - Properties
public extension String {

    /// Check if string contains one or more letters.
    ///
    ///        "123abc".hasLetters -> true
    ///        "123".hasLetters -> false
    ///
    var hasLetters: Bool {
        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }

    /// Check if string contains one or more numbers.
    ///
    ///        "abcd".hasNumbers -> false
    ///        "123abc".hasNumbers -> true
    ///
    var hasNumbers: Bool {
        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }

    #if canImport(Foundation)
    /// Check if string is a valid URL.
    ///
    ///        "https://apple.com".isValidUrl -> true
    ///
    var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    #endif

    #if canImport(Foundation)
    /// Check if string is a valid schemed URL.
    ///
    ///        "https://apple.com".isValidSchemedUrl -> true
    ///        "apple.com".isValidSchemedUrl -> false
    ///
    var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    #endif

    #if canImport(Foundation)
    /// Check if string is a valid https URL.
    ///
    ///        "https://apple.com".isValidHttpsUrl -> true
    ///
    var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    #endif

    #if canImport(Foundation)
    /// Check if string is a valid http URL.
    ///
    ///        "http://apple.com".isValidHttpUrl -> true
    ///
    var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    #endif

    #if canImport(Foundation)
    /// Check if string is a valid file URL.
    ///
    ///        "file://Documents/file.txt".isValidFileUrl -> true
    ///
    var isValidFileUrl: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    #endif

    #if canImport(Foundation)
    /// Readable string from a URL string.
    ///
    ///        "what%20a%20time%20to%20be%20alive".urlDecoded -> "what a time to be alive"
    ///
    var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    #endif

    #if canImport(Foundation)
    /// URL escaped string.
    ///
    ///        "what a time to be alive".urlEncoded -> "what%20a%20time%20to%20be%20alive"
    ///
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    #endif

    #if canImport(Foundation)
    /// Bool value from string (if applicable).
    ///
    ///        "1".bool -> true
    ///        "False".bool -> false
    ///        "Hello".bool = nil
    ///
    var bool: Bool? {
        let lowercasedSelf = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch lowercasedSelf {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    #endif

    #if canImport(Foundation)
    /// SwifterSwift: URL from string (if applicable).
    ///
    ///        "https://apple.com".url -> URL(string: "https://apple.com")
    ///        "not url".url -> nil
    ///
    var url: URL? {
        return URL(string: self)
    }
    #endif

    /// String to Int.
    var int: Int? {
        return Int(self)
    }

    /// String to Double.
    var double: Double? {
        return Double(self)
    }

    #if canImport(Foundation)
    /// String trimmed from spaces or new lines.
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    #endif

    #if canImport(Foundation)
    /// Check if the given string contains only white spaces
    var isWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    #endif

    #if canImport(Foundation)
    /// String with underscore instead of whitespace
    var unWhitespace: String {
        return replacingOccurrences(of: " ", with: "_")
    }
    #endif
}

// MARK: - Methods
public extension String {

    #if canImport(Foundation)
    /// Returns a localized string, with an optional comment for translators.
    ///
    ///        "Hello world".localized -> Bonjour le monde
    ///
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    #endif

    /// Truncate a string to a limited given number of characters
    ///
    ///     "Very very long sentence".truncated(toLength: 9) -> "Very very"
    ///
    /// - Parameter toLength: maximum number of characters before cutting.
    /// - Returns: truncated string.
    func truncate(toLength length: Int) -> String {
        let stringLength: Int = self.count
        let clippedString = self.prefix(min(stringLength, length))
        return String(clippedString)
    }

    #if canImport(Foundation)
    /// Verify if string matches the regex pattern.
    ///
    /// - Parameter pattern: Pattern to verify.
    /// - Returns: true if string matches the pattern.
    func matches(pattern: String) -> Bool {
        return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    #endif
}

// MARK: - NSAttributedString
public extension String {

    #if os(iOS)
    /// Bold string.
    var bold: NSAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [.font:
                                            UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    #endif

    #if canImport(Foundation)
    /// Underlined string
    var underline: NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    #endif

    #if canImport(Foundation)
    /// Strikethrough string.
    var strikethrough: NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.strikethroughStyle:
                                    NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    #endif

    #if os(iOS)
    /// Italic string.
    var italic: NSAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [.font:
                                            UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    #endif
}

#if canImport(Foundation)

// MARK: - NSString extensions
public extension String {

    /// NSString from a string.
    var nsString: NSString {
        return NSString(string: self)
    }

    /// NSString pathExtension.
    var pathExtension: String {
        return (self as NSString).pathExtension
    }

    /// NSString pathComponents.
    var pathComponents: [String] {
        return (self as NSString).pathComponents
    }
}

#endif

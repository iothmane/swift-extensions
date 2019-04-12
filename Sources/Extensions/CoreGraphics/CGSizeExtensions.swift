//
//  CGSizeExtensions.swift
//  SwiftExtensions
//
//  Created by Othmane Kaach on 2019-04-11.
//  Copyright © 2019 IT's Easy. All rights reserved.
//

// MARK: - Methods
public extension CGSize {

    /// Returns the aspect ratio.
    var aspectRatio: CGFloat {
        return height == 0 ? 0 : width / height
    }

    /// Returns width or height, whichever is the bigger value.
    var maxDimension: CGFloat {
        return max(width, height)
    }

    /// Returns width or height, whichever is the smaller value.
    var minDimension: CGFloat {
        return min(width, height)
    }
}

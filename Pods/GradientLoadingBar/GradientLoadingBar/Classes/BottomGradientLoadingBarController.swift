//
//  BottomGradientLoadingBarController.swift
//  GradientLoadingBar
//
//  Created by Felix Mau on 09/03/18.
//  Copyright © 2018 Felix Mau. All rights reserved.
//

import Foundation

/// Typealias for controller to match pod name.
public typealias BottomGradientLoadingBar = BottomGradientLoadingBarController

/// Subclass of `GradientLoadingBar`, that shows the loading view at the bottom of the superview.
/// This allows attaching the view easily to a navigation bar.
open class BottomGradientLoadingBarController: GradientLoadingBar {
    // MARK: - Public methods

    open override func setupConstraints(superview: UIView) {
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),

            gradientView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: CGFloat(height))
        ])
    }
}

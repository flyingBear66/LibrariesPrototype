//
//  LTViewController+GradientLoadingBar.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

extension LTViewController {
    func showGradientLoadingBar() {
        gradientLoadingBar.show()
    }

    func hideGradientLoadingBar() {
        gradientLoadingBar.hide()
    }

    func toggleGradientLoadingBar() {
        gradientLoadingBar.toggle()
    }
}

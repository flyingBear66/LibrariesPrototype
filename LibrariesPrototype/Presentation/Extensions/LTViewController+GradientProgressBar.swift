//
//  LTViewController+GradientProgressBar.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

extension LTViewController {

    func showGradientProgressBar() {
        gradientLoadingBar.show()
    }

    func hideGradientProgressBar() {
        gradientLoadingBar.hide()
    }

    func toggleGradientProgressBar() {
        gradientLoadingBar.toggle()
    }
}

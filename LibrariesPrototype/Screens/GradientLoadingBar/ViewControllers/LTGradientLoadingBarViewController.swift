//
//  LTGradientLoadingBarViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 25/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import GradientLoadingBar
import UIKit

class LTGradientLoadingBarViewController: LTViewController {
    // MARK: - UIControls
    private let safeAreaGradientLoadingBar = GradientLoadingBar(height: GradientLoadingBarConstants.height,
                                                                isRelativeToSafeArea: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideGradientLoadingBarRelativeToSafeArea()
    }

    func showGradientLoadingBarRelativeToSafeArea() {
        safeAreaGradientLoadingBar.toggle()
    }
    
    func hideGradientLoadingBarRelativeToSafeArea() {
        safeAreaGradientLoadingBar.hide()
    }
}

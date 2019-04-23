//
//  GradientProgressButtonViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import GradientLoadingBar

class GradientProgressButtonViewController: LTViewController {
    // MARK: - UIControls
    private let safeAreaGradientLoadingBar = GradientLoadingBar(height: 10.0,
                                                                isRelativeToSafeArea: false)


    private let safeAreaGradientLoadingBarSafe = GradientLoadingBar(height: 10.0,
                                                                    isRelativeToSafeArea: true)

    // MARK: - Variables
    private var viewModel: GradientProgressButtonViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientProgressButtonViewModel) {
        super.init()
        self.viewModel = viewModel
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        safeAreaGradientLoadingBarSafe.show()
        safeAreaGradientLoadingBar.show()
    }

    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .white
        title = "Button"
    }

    func updateUI() {
    }
    // MARK: - UI Actions
}

//
//  GradientLoadingStatusBarWithSafeAreaViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import GradientLoadingBar
import UIKit

class GradientLoadingStatusBarWithSafeAreaViewController: LTGradientLoadingBarViewController {
    private let safeAreaGradientLoadingBarSafe = GradientLoadingBar(height: GradientLoadingBarConstants.height,
                                                                    isRelativeToSafeArea: true)

    // MARK: - Variables
    private var viewModel: GradientLoadingStatusBarWithSafeAreaViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientLoadingStatusBarWithSafeAreaViewModel) {
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
    }

    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .white
        title = "Status Bar w/Safe Area"
    }

    func updateUI() {
        showGradientLoadingBarRelativeToSafeArea()
    }
    // MARK: - UI Actions
}

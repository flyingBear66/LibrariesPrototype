//
//  GradientLoadingStatusBarViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import GradientLoadingBar

class GradientLoadingStatusBarViewController: LTViewController {
    
    // MARK: - Variables
    private var viewModel: GradientLoadingStatusBarViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientLoadingStatusBarViewModel) {
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
        title = "Status Bar"
    }

    func updateUI() {
        showGradientLoadingBar()
    }
    // MARK: - UI Actions
}

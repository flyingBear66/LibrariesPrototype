//
//  GradientProgressStatusBarViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class GradientProgressStatusBarViewController: LTViewController {
    // MARK: - UIControls

    // MARK: - Variables
    private var viewModel: GradientProgressStatusBarViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientProgressStatusBarViewModel) {
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
    }
    // MARK: - UI Actions
}

//
//  GradientProgressMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class GradientProgressMainViewController: LTViewController {
    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()

    // MARK: - Variables
    private var viewModel: GradientProgressMainViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientProgressMainViewModel) {
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

    }

    func updateUI() {

    }
}

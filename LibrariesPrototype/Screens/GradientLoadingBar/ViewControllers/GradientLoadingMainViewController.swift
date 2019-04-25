//
//  GradientLoadingMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class GradientLoadingMainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()

    // MARK: - Variables
    private var viewModel: GradientLoadingMainViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientLoadingMainViewModel) {
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
        title = "Gradient Progress Bar"
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }
    // MARK: - UI Actions
}

extension GradientLoadingMainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LTTableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.menus[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openScreen(withIndexPath: indexPath)
    }
}

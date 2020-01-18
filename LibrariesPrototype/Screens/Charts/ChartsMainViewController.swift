//
//  ChartsMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 18/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import UIKit

class ChartsMainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()

    // MARK: - Variables
    var viewModel: ChartsMainViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: ChartsMainViewModel) {
        super.init()
        self.viewModel = viewModel
        setupViews()
    }

    @available(*, unavailable)
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
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }

    func bindViewModel() {
    }

    // MARK: - UI Actions
}

extension ChartsMainViewController: UITableViewDataSource, UITableViewDelegate {
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

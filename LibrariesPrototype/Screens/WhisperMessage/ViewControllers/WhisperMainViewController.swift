//
//  WhisperMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/22/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class WhisperMainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()
    
    // MARK: - Variables
    private var viewModel: WhisperMainViewModel!
    
    // MARK: - View LifeCycle
    init(withViewModel viewModel: WhisperMainViewModel) {
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
        title = "Whisper"
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }
    
    func bindViewModel() {
        // TODO: When needed
    }
    
    // MARK: - UI Actions

}

extension WhisperMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LTTableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showMessage(withWhisperMenuCase: .basic)
    }
    
}

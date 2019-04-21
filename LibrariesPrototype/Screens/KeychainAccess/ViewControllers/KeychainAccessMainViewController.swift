//
//  KeychainAccessMainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class KeychainAccessMainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()
    
    // MARK: - Variables
    private var viewModel: KeychainAccessMainViewModel!
    
    // MARK: - View LifeCycle
    init(withViewModel viewModel: KeychainAccessMainViewModel) {
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
        bindViewModel()
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
        viewModel.keychainItems.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.getKeychainItems()
    }
}

extension KeychainAccessMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.keychainItems.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LTTableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.keychainItems.value[indexPath.row]
        return cell
    }
    
}

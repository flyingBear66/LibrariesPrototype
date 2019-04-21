//
//  MainEmptyDataSetListViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/20/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class MainEmptyDataSetListViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()
    
    let menus: [String] = {
       return ["List", "List with Image", "List With Button"]
    }()
    
    // MARK: - Variables
    private var viewModel: MainEmptyDataSetListViewModel!
    
    // MARK: - View LifeCycle
    init(withViewModel viewModel: MainEmptyDataSetListViewModel) {
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
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }
}

extension MainEmptyDataSetListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LTTableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openScreen(withIndexPath: indexPath)
    }
}

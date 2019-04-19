//
//  MainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum MenuCase: Int {
    case nativeNetworking = 0
    case none = -1
}

class MainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()
    
    // MARK: - Variables
    private var viewModel: MainViewModel!
    
    // MARK: - View LifeCycle
    init(with viewModel: MainViewModel) {
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
    
    func bindViewModel() {

    }
    
    func openScreen(with menuIndex: MenuCase) {
        switch menuIndex {
        case .nativeNetworking:
            openNativeNetworkingScreens()
        default:
            print("Default case")
        }
    }
    
    func openNativeNetworkingScreens() {
        let service = HeroListService()
        let viewModel = HeroListViewModel(with: service)
        present(LTNavigationController(rootViewController: HeroListViewController(with: viewModel)), animated: true, completion: nil)
    }
    
    // MARK: - UI Actions

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LTTableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel.menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openScreen(with: MenuCase(rawValue: indexPath.row) ?? .none)
    }
    
    
}

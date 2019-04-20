//
//  MainEmptyDataSetListViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/20/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

fileprivate enum EmptyDataSetMenuCase: Int {
    case list = 0
    case listWithImage = 1
    case listWithButton = 2
    case none = -1
}

class MainEmptyDataSetListViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        return tableView
    }()
    
    let menus: [String] = {
       return ["List", "List with Image", "List With Button"]
    }()
    
    // MARK: - View LifeCycle
    override init() {
        super.init()
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
    
    fileprivate func openScreen(with menuIndex: EmptyDataSetMenuCase) {
        switch menuIndex {
        case .list:
            openList()
        case .listWithImage:
            openListWithImage()
        case .listWithButton:
            openListWithButton()
        default:
            print("Default case")
        }
    }
    
    func openList() {
        navigationController?.pushViewController(EmptyDataSetListViewController(), animated: true)
    }
    
    func openListWithImage() {
        navigationController?.pushViewController(EmptyDataSetListWithImageViewController(), animated: true)
    }
    
    func openListWithButton() {
        navigationController?.pushViewController(EmptyDataSetListWithButtonViewController(), animated: true)
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
        openScreen(with: EmptyDataSetMenuCase(rawValue: indexPath.row) ?? .none)
    }
}

//
//  LottieMainViewController.swift
//  LibrariesPrototype
//
//  Created by ozgunzor on 11/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import Lottie
import UIKit

class LottieMainViewController: LTViewController {

    // MARK: - UIControls
    let tableView: LTTableView = {
        let tableView = LTTableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = 200
        return tableView
    }()

    var animations = [AnimationView]()
    
    // MARK: - Variables
    
    // MARK: - View LifeCycle
    override init() {
        super.init()
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
        for n in 1...20 {
            animations.append(AnimationView(animation: Animation.named("biking\(n)", subdirectory: "lottieFiles")))
        }

        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateUI() {
        view.addSubview(tableView)
        tableView.addConstraints(equalToSuperview())
    }
}

extension LottieMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        animations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .lightGray

        let animationView = animations[indexPath.row]
        cell.addSubview(animationView)
        animationView.addConstraints(equalToSuperview())

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let lottieDetailViewController = LottieDetailViewController(with: "biking\(indexPath.row + 1)")
        navigationController?.pushViewController(lottieDetailViewController, animated: true)
    }
}

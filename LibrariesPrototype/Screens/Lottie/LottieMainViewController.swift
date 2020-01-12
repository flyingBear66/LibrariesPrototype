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
        return tableView
    }()

    // MRK
    let animationView1 = AnimationView()
    let animationView2 = AnimationView()

    let animation1 = Animation.named("biking1", subdirectory: "lottieFiles")
    let animation2 = Animation.named("biking2", subdirectory: "lottieFiles")
    
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
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .lightGray
        if indexPath.row == 0 {
            animationView1.animation = animation1
            cell.addSubview(animationView1)
            animationView1.addConstraints(equalToSuperview())
        } else if indexPath.row == 1 {
            animationView2.animation = animation2
            cell.addSubview(animationView2)
            animationView2.addConstraints(equalToSuperview())
        } else {
            cell.textLabel?.text = "\(indexPath.row)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let lottieDetailViewController = LottieDetailViewController(with: "biking\(indexPath.row + 1)")
        navigationController?.pushViewController(lottieDetailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            animationView1.play()
        } else if indexPath.row == 1 {
            animationView2.play()
        }
    }
}

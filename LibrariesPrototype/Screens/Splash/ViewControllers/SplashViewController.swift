//
//  SplashViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class SplashViewController: LTViewController {

    // MARK: - Variables
    private var viewModel: SplashViewModel!
    
    // MARK: - View LifeCycle
    init(with viewModel: SplashViewModel) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .blue
    }
    
    func updateUI() {

    }
    
    func bindViewModel() {

    }
    
}

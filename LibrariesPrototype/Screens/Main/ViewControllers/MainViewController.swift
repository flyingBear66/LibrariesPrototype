//
//  MainViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class MainViewController: LTViewController {

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
    }
    
    // MARK: - Helpers
    func setupViews() {
        view.backgroundColor = .white
    }
    
    func updateUI() {

    }
    
    func bindViewModel() {

    }
    
    // MARK: - UI Actions

}


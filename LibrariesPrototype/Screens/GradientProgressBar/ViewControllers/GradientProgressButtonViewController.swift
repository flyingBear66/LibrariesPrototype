//
//  GradientProgressButtonViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import GradientLoadingBar

class GradientProgressButtonViewController: LTViewController {
    // MARK: - UIControls
    private let safeAreaGradientLoadingBar = GradientLoadingBar(height: 10.0,
                                                                isRelativeToSafeArea: false)


    private let safeAreaGradientLoadingBarSafe = GradientLoadingBar(height: 10.0,
                                                                    isRelativeToSafeArea: true)

    
    let bottomGradientButtonView: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Bottom"
        button.type = .bottom
        return button
    }()
    
    let centerGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Center"
        button.type = .top
        return button
    }()
    
    let topGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Top"
        button.type = .top
        return button
    }()
    
    // MARK: - Variables
    private var viewModel: GradientProgressButtonViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientProgressButtonViewModel) {
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
        title = "Button"
    }

    func updateUI() {
        view.addSubview(bottomGradientButtonView)
        view.addSubview(topGradientButton)
        view.addSubview(centerGradientButton)
        
        //
        centerGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                             equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                             equal(self.view, \.centerXAnchor),
                                             equal(self.view, \.centerYAnchor)])
        
        //
        topGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                             equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                             equal(centerGradientButton, \.bottomAnchor, \.topAnchor, constant: -8),
                                             equal(self.view, \.centerXAnchor)])
        
        //
        bottomGradientButtonView.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                 equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                 equal(centerGradientButton, \.topAnchor, \.bottomAnchor, constant: 8),
                                                 equal(self.view, \.centerXAnchor)])
        
    }
    
    // MARK: - UI Actions
    
    @objc func topGradientButtonTapped() {
//        topGradientButton.toggle()
    }
    
    @objc func centerGradientButtonTapped() {
//        centerGradientButton.toggle()
    }
    
    @objc func bottomGradientButtonTapped() {
//        centerGradientButton.toggle()
    }
}

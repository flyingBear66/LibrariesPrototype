//
//  GradientLoadingButtonViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import GradientLoadingBar
import UIKit

class GradientLoadingButtonViewController: LTViewController {
    // MARK: - UIControls
    let leftTop3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftTop3"
        button.type = .top
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let top3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Top3"
        button.type = .top
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let rightTop3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightTop3"
        button.type = .top
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let leftTop2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftTop2"
        button.type = .top
        button.height = 10
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let top2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Top2"
        button.type = .top
        button.height = 10
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let rightTop2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightTop2"
        button.type = .top
        button.height = 10
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let leftTopGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftTop"
        button.type = .top
        button.height = 15
        button.durations = Durations(fadeIn: 5.0, fadeOut: 5.0, progress: 10.0)
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let topGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Top"
        button.type = .top
        button.height = 15
        button.durations = Durations(fadeIn: 5.0, fadeOut: 5.0, progress: 5.0)
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()
    
    let rightTopGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightTop"
        button.type = .top
        button.height = 15
        button.durations = Durations(fadeIn: 1.0, fadeOut: 1.0, progress: 2.0)
        button.gradientColorList = [.red, .blue, .yellow]
        return button
    }()

    let centerLeftGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftCenter"
        button.type = .top
        button.height = 20
        button.gradientColorList = [.lightGray, .gray, .darkGray]
        return button
    }()
    
    let centerGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Center"
        button.type = .top
        button.height = 20
        button.gradientColorList = [.lightGray, .gray, .darkGray]
        return button
    }()
    
    let centerRightGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightCenter"
        button.type = .top
        button.height = 20
        button.gradientColorList = [.lightGray, .gray, .darkGray]
        return button
    }()

    let leftBottomGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftBottom"
        button.type = .bottom
        button.height = 15
        return button
    }()
    
    let bottomGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Bottom"
        button.type = .bottom
        button.height = 15
        return button
    }()
    
    let rightBottomGradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightBottom"
        button.type = .bottom
        button.height = 15
        return button
    }()
    
    let leftBottom2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftBottom2"
        button.type = .bottom
        button.height = 10
        return button
    }()
    
    let bottom2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Bottom2"
        button.type = .bottom
        button.height = 10
        return button
    }()

    let rightBottom2GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightBottom2"
        button.type = .bottom
        button.height = 10
        return button
    }()
    
    let leftBottom3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "leftBotto3m"
        button.type = .bottom
        return button
    }()
    
    let bottom3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "Bottom3"
        button.type = .bottom
        return button
    }()
    
    let rightBottom3GradientButton: LTGradientBarButton = {
        let button = LTGradientBarButton()
        button.title = "rightBottom3"
        button.type = .bottom
        return button
    }()
    
    // MARK: - Variables
    private var viewModel: GradientLoadingButtonViewModel!

    // MARK: - View LifeCycle
    init(withViewModel viewModel: GradientLoadingButtonViewModel) {
        super.init()
        self.viewModel = viewModel
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
        title = "Button"
    }
    
    func addSubviews() {
        view.addSubview(leftTop3GradientButton)
        view.addSubview(top3GradientButton)
        view.addSubview(rightTop3GradientButton)
        view.addSubview(leftTop2GradientButton)
        view.addSubview(top2GradientButton)
        view.addSubview(rightTop2GradientButton)
        view.addSubview(leftTopGradientButton)
        view.addSubview(topGradientButton)
        view.addSubview(rightTopGradientButton)
        view.addSubview(centerLeftGradientButton)
        view.addSubview(centerGradientButton)
        view.addSubview(centerRightGradientButton)
        view.addSubview(leftBottomGradientButton)
        view.addSubview(bottomGradientButton)
        view.addSubview(rightBottomGradientButton)
        view.addSubview(leftBottom2GradientButton)
        view.addSubview(bottom2GradientButton)
        view.addSubview(rightBottom2GradientButton)
        view.addSubview(leftBottom3GradientButton)
        view.addSubview(bottom3GradientButton)
        view.addSubview(rightBottom3GradientButton)
    }

    func updateUI() {
        addSubviews()
        // TODO: Remove lines for Swiftlint
        centerGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                             equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                             equal(self.view, \.centerXAnchor),
                                             equal(self.view, \.centerYAnchor)])

        centerLeftGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                 equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                 equal(centerGradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                                 equal(centerGradientButton, \.centerYAnchor)])

        centerRightGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                  equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                  equal(centerGradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                  equal(centerGradientButton, \.centerYAnchor)])

        topGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                          equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                          equal(centerGradientButton, \.bottomAnchor, \.topAnchor, constant: -8),
                                          equal(self.view, \.centerXAnchor)])

        top2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                           equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                           equal(topGradientButton, \.bottomAnchor, \.topAnchor, constant: -8),
                                           equal(self.view, \.centerXAnchor)])

        rightTop2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                equal(top2GradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                equal(top2GradientButton, \.centerYAnchor)])
        
        rightTopGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                               equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                               equal(topGradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                               equal(topGradientButton, \.centerYAnchor)])
        
        leftTopGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                              equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                              equal(topGradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                              equal(topGradientButton, \.centerYAnchor)])
        
        leftTop2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                               equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                               equal(top2GradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                               equal(top2GradientButton, \.centerYAnchor)])
        
        top3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                           equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                           equal(top2GradientButton, \.bottomAnchor, \.topAnchor, constant: -8),
                                           equal(self.view, \.centerXAnchor)])
        
        rightTop3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                equal(top3GradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                equal(top3GradientButton, \.centerYAnchor)])
        
        leftTop3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                               equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                               equal(top3GradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                               equal(top3GradientButton, \.centerYAnchor)])

        bottomGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                             equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                             equal(centerGradientButton, \.topAnchor, \.bottomAnchor, constant: 8),
                                             equal(self.view, \.centerXAnchor)])

        leftBottomGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                 equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                 equal(bottomGradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                                 equal(bottomGradientButton, \.centerYAnchor)])
        
        rightBottomGradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                  equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                  equal(bottomGradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                  equal(bottomGradientButton, \.centerYAnchor)])

        leftBottom2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                  equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                  equal(bottom2GradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                                  equal(bottom2GradientButton, \.centerYAnchor)])
        
        rightBottom2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                   equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                   equal(bottom2GradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                   equal(bottom2GradientButton, \.centerYAnchor)])

        leftBottom3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                  equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                  equal(bottom3GradientButton, \.rightAnchor, \.leftAnchor, constant: -8),
                                                  equal(bottom3GradientButton, \.centerYAnchor)])

        rightBottom3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                                   equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                                   equal(bottom3GradientButton, \.leftAnchor, \.rightAnchor, constant: 8),
                                                   equal(bottom3GradientButton, \.centerYAnchor)])
        
        bottom2GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                              equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                              equal(bottomGradientButton, \.topAnchor, \.bottomAnchor, constant: 8),
                                              equal(self.view, \.centerXAnchor)])
        
        bottom3GradientButton.addConstraints([equal(self.view, \.heightAnchor, \.heightAnchor, ratio: 0.1),
                                              equal(self.view, \.widthAnchor, \.widthAnchor, ratio: 0.3),
                                              equal(bottom2GradientButton, \.topAnchor, \.bottomAnchor, constant: 8),
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

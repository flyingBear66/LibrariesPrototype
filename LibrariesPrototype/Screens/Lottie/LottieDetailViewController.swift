//
//  LottoeDetailViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 12/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import Lottie
import UIKit

class LottieDetailViewController: LTViewController {

    // MARK: - UIControls
    let containerView: LTView = {
        let containerView = LTView()
        return containerView
    }()

    let playButton: LTButton = {
        let button = LTButton(type: .system)
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(playLottie), for: .touchUpInside)
        return button
    }()

    let animationView = AnimationView()

    // MARK: - Variables

    // MARK: - View LifeCycle
    required init(with animationName: String) {
        super.init()
        setupViews()
        animationView.animation = Animation.named(animationName, subdirectory: "lottieFiles")
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
    }

    func updateUI() {
        containerView.backgroundColor = .lightGray

        // Adding Views
        containerView.addSubview(playButton)
        view.addSubview(animationView)
        view.addSubview(containerView)

        // Adding Constraints
        playButton.addConstraints(equalToSuperview())

        animationView.addConstraints([equal(containerView, \.bottomAnchor, \.topAnchor, constant: 0),
                                      equal(view, \.trailingAnchor),
                                      equal(view, \.leadingAnchor)])

        containerView.addConstraints([equal(view, \.bottomAnchor),
                                      equal(animationView, \.topAnchor, \.bottomAnchor, constant: 0),
                                      equal(view, \.trailingAnchor),
                                      equal(view, \.leadingAnchor),
                                      equal(\.heightAnchor, to: 50)])
    }

    // MARK: - UI Actions
    @objc func playLottie() {
        animationView.play()
    }
}

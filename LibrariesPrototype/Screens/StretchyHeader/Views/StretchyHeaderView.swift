//
//  StretchyHeaderView.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 28/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class StretchyHeaderView: LTCollectionReusableView {
    let imageView: LTImageView = {
        let imageView = LTImageView(image: #imageLiteral(resourceName: "StretchyHeader"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: LTHeavyLabel = {
        let label = LTHeavyLabel()
        label.text = "Title Label"
        return label
    }()
    
    let descriptionLabel: LTLightLabel = {
        let label = LTLightLabel()
        label.text = "Description Label"
        return label
    }()
    
    var animator: LTViewPropertyAnimator!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
        
        addSubview(imageView)
        setupVisualEffectBlur()
        setupGradientLayer()
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        imageView.addConstraints(equalToSuperview())
        descriptionLabel.addConstraints([equal(self, \.bottomAnchor, constant: -8),
                                         equal(titleLabel, \.topAnchor, \.bottomAnchor, constant: 0),
                                         equal(self, \.leadingAnchor, constant: 8),
                                         equal(self, \.trailingAnchor, constant: -8)])
        titleLabel.addConstraints([equal(self, \.leadingAnchor, constant: 8),
                                   equal(self, \.trailingAnchor, constant: -8)])
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Helpers
    func setupVisualEffectBlur() {
        animator = LTViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self?.addSubview(visualEffectView)
            visualEffectView.addConstraints(equalToSuperview())
        })
        animator.fractionComplete = 0
    }
    
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        layer.addSublayer(gradientLayer)
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.addConstraints([equal(self, \.leadingAnchor, constant: 0),
                                              equal(self, \.trailingAnchor, constant: 0),
                                              equal(self, \.bottomAnchor, constant: 0)])
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = bounds
        gradientLayer.frame.origin.y -= bounds.height
    }
}

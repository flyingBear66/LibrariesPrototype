//
//  HeroDetailContainerView.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 05/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroDetailContainerView: LTView {
    public let containerTitleLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.text = "ContainerTitle"
        return label
    }()
    
    public let emptyStateLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.text = "There isn't any found! :("
        return label
    }()

    public var detailViews: [HeroDetailView] = {
        var views = [HeroDetailView]()
        for _ in 1...HeroDetailServiceConstants.requiredDetailCount {
            views.append(HeroDetailView())
        }
        return views
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(detailViews[0])
        addSubview(detailViews[1])
        addSubview(detailViews[2])
        addSubview(containerTitleLabel)

        containerTitleLabel.addConstraints([equal(self, \.topAnchor, constant: 8),
                                            equal(self, \.leadingAnchor),
                                            equal(self, \.trailingAnchor),
                                            equal(\.heightAnchor, to: 30)])

        detailViews[0].addConstraints([equal(detailViews[1], \.bottomAnchor, \.topAnchor, constant: -8),
                                       equal(self, \.leadingAnchor),
                                       equal(self, \.trailingAnchor),
                                       equal(containerTitleLabel, \.topAnchor, \.bottomAnchor, constant: 0)])

        detailViews[1].addConstraints([equal(detailViews[2], \.bottomAnchor, \.topAnchor, constant: -8),
                                       equal(self, \.leadingAnchor),
                                       equal(self, \.trailingAnchor)])

        detailViews[2].addConstraints([equal(self, \.bottomAnchor, constant: -20),
                                       equal(self, \.leadingAnchor),
                                       equal(self, \.trailingAnchor)])

        layer.cornerRadius = CGFloat(HeroDetailViewConstants.cardCornerRadius)
        clipsToBounds = true
    }
    
    public func removeDetailViews() {
        for detailView in detailViews {
            detailView.removeFromSuperview()
        }
        
        addSubview(emptyStateLabel)
        emptyStateLabel.addConstraints([equal(self, \.bottomAnchor, constant: -8),
                                        equal(self, \.leadingAnchor, constant:  8),
                                        equal(self, \.trailingAnchor),
                                        equal(containerTitleLabel, \.topAnchor, \.bottomAnchor, constant: 0)])
        self.layoutIfNeeded()
    }
}

//
//  HeroDetailView.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 05/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroDetailView: LTView {

    let titleLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .black
        label.text = EmptyStateStrings.heroDetail
        return label
    }()

    let descriptionLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.text = EmptyStateStrings.heroDetail
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.addConstraints([equal(self, \.topAnchor),
                                   equal(self, \.leadingAnchor, constant: 8),
                                   equal(self, \.trailingAnchor, constant: -8),
                                   equal(\.heightAnchor, to: 30),
                                   equal(descriptionLabel, \.bottomAnchor, \.topAnchor, constant: 0)])
        
        descriptionLabel.addConstraints([equal(self, \.bottomAnchor),
                                         equal(self, \.leadingAnchor, constant: 8),
                                         equal(self, \.trailingAnchor, constant: -8)])
    }

}

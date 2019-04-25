//
//  HeroCollectionViewCell.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroCollectionViewCell: LTCollectionViewCell {

    // MARK: - UIControls
    let heroImageView: LTImageView = {
        let imageView = LTImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let heroNameLabel: LTLabel = {
        let label = LTLabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let favoriteButton: FavoriteButton = {
        let button = FavoriteButton(type: .custom)
        button.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Variables
    var viewModel: HeroCellViewModel! {
        didSet {
            updateUI()
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    func setupViews() {
        
        backgroundColor = .blue
        clipsToBounds = true
        layer.cornerRadius = CGFloat(HeroCellViewConstants.cornerRadius)

        addSubview(heroImageView)
        addSubview(heroNameLabel)
        addSubview(favoriteButton)
        favoriteButton.addConstraints([equal(self, \.topAnchor, constant: 8),
                                       equal(self, \.trailingAnchor, constant: -8)])
        heroImageView.addConstraints([equal(self, \.topAnchor),
                                  equal(self, \.bottomAnchor),
                                  equal(self, \.leadingAnchor),
                                  equal(self, \.trailingAnchor)])
        heroNameLabel.addConstraints([equal(self, \.centerXAnchor),
                                      equal(self, \.centerYAnchor, constant: frame.height / 5),
                                      equal(self, \.leadingAnchor, constant: 8),
                                      equal(self, \.trailingAnchor, constant: -8)])
    }

    func updateUI() {
        let strokeTextAttributes: [NSAttributedString.Key : Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.white,
            .strokeWidth : -2.0
        ]
        self.heroNameLabel.attributedText = NSAttributedString(string: self.viewModel.heroName, attributes: strokeTextAttributes)
        self.heroImageView.imageFromServerURL(self.viewModel.heroImageURLString, placeHolder: nil)
        
        viewModel.favorited.bindAndFire { [weak self] favorited in
            DispatchQueue.main.async {
                self?.favoriteButton.isSelected = favorited
            }
        }
    }
    
    // MARK: - UI Actions
    @objc func favoriteTapped() {
        print("Cell Favorite")
        viewModel.favoriteTapped()
    }
    
}

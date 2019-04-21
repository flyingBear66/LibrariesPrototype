//
//  RepositoryCollectionViewCell.swift
//  testiOSOzgunEmreZor
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoryCollectionViewCell: LTCollectionViewCell {
    
    // MARK: - Variables

    var viewModel: RepositoryViewModel? {
        didSet {
            self.setupViewModel()
        }
    }
    
    let repositoryNameLabel: LTLabel = {
        let newRepositoryNameLabel = LTLabel()
        newRepositoryNameLabel.textAlignment = .center
        newRepositoryNameLabel.text = "Name of the Repo"
        newRepositoryNameLabel.font = UIFont.systemFont(ofSize: 20)
        return newRepositoryNameLabel
    }()
    
    let repositoryDescriptionLabel: LTLabel = {
        let newRepositoryDescriptionLabel = LTLabel()
        newRepositoryDescriptionLabel.textColor = .gray
        newRepositoryDescriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        newRepositoryDescriptionLabel.font = UIFont.systemFont(ofSize: 15)
        return newRepositoryDescriptionLabel
    }()
    
    let repositoryOwnerLoginLabel: LTLabel = {
        let newRepositoryOwnerLoginLabel = LTLabel()
        newRepositoryOwnerLoginLabel.textAlignment = .right
        newRepositoryOwnerLoginLabel.textColor = .darkGray
        newRepositoryOwnerLoginLabel.text = "Owner Login"
        newRepositoryOwnerLoginLabel.font = UIFont.systemFont(ofSize: 15)
        return newRepositoryOwnerLoginLabel
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Methods
    
    private func setupViews() {
        // add Views
        addSubview(repositoryNameLabel)
        addSubview(repositoryDescriptionLabel)
        addSubview(repositoryOwnerLoginLabel)
        
        // set Constraints
        repositoryNameLabel.addConstraints([equal(self, \.leadingAnchor, constant: 8),
                                            equal(repositoryDescriptionLabel, \.bottomAnchor, \.topAnchor, constant: 0),
                                            equal(self, \.trailingAnchor, constant: -8),
                                            equal(self, \.topAnchor)])
        
        repositoryDescriptionLabel.addConstraints([equal(self, \.leadingAnchor, constant: 8),
                                                   equal(repositoryOwnerLoginLabel, \.bottomAnchor, \.topAnchor, constant: 0),
                                                   equal(self, \.trailingAnchor, constant: -8)])
        
        repositoryOwnerLoginLabel.addConstraints([equal(self, \.bottomAnchor),
                                                  equal(self, \.leadingAnchor, constant: 8),
                                                  equal(self, \.trailingAnchor, constant: -8)])
        

    }
    private func setupViewModel() {
        guard let viewModel = self.viewModel else {
            fatalError("ViewModel has to be set correctly")
        }

        
        self.repositoryNameLabel.text = viewModel.name.value
        self.repositoryDescriptionLabel.text = viewModel.repoDescription.value
        self.repositoryOwnerLoginLabel.text = viewModel.ownerLogin.value
        self.backgroundColor = viewModel.cellBackgroundColor.value
    }
}

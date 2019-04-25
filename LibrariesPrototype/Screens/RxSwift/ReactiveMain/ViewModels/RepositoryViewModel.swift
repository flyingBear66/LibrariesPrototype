//
//  RepositoryViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 3/30/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import RxSwift
import UIKit

class RepositoryViewModel: LTViewModel {
    
    public let name: Variable<String> = Variable("Init")
    public let repoDescription: Variable<String> = Variable("Init")
    public let ownerLogin: Variable<String> = Variable("Init")
    public let cellBackgroundColor: Variable<UIColor> = Variable(.white)
    
    private var model: Repository?
    
    init(repoModel: Repository) {
        self.model = repoModel
        self.name.value = repoModel.name
        self.repoDescription.value = repoModel.description ?? "Nil"
        self.ownerLogin.value = "Owner Login: \(repoModel.owner.login ?? "Nil")"
        self.cellBackgroundColor.value = repoModel.fork ? UIColor(red: 75.0 / 255.0, green: 242.0 / 255.0, blue: 113.0 / 255.0, alpha: 1.0) : .white
    }
    
}

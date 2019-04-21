//
//  SplashViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

protocol SplashViewModelEvents {
    var showMainMenu: (() -> Void)? {get set}
}
    
class SplashViewModel: LTViewModel, SplashViewModelEvents {

    // MARK: - Events
    var showMainMenu: (() -> Void)?
    
    // MARK: - Variables
    private let service: SplashService!
    
    // MARK: - Init
    init(with service: SplashService) {
        self.service = service
    }
    
    // MARK: - Services

}

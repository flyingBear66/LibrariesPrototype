//
//  MainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class MainViewModel: LTViewModel {

    // MARK: - Variables
    private let service: MainService!
    public var menus: [String] {
        get {
            return self.getMenus()
        }
    }
    
    // MARK: - Init
    init(with service: MainService) {
        self.service = service
    }
    
    // MARK: - Services

    private func getMenus() -> [String] {
        return ["Native Networking Test with MarvelAPI", "Empty Data Set List"]
    }
    
}

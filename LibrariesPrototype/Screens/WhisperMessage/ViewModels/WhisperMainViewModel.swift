//
//  WhisperMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/22/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum WhisperMenuCase: Int {
    case basic = 0
    case none = -1
}

class WhisperMainViewModel: LTViewModel {

    // MARK: - Variables
    public var menus: [String] {
        get {
            return self.getMenus()
        }
    }
    
    // MARK: - Services
    private func getMenus() -> [String] {
        return ["Basic", "none"]
    }
    
    // MARK: - Services
    func showMessage(withWhisperMenuCase case: WhisperMenuCase) {
        
    }
    
}

//
//  WhisperMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/22/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum WhisperMenuCase: Int {
    case whisper = 0
    case shout = 1
    case whistle = 2
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
        // TODO:
//        var menu = [String]()
//        WhisperMenuCase.allCases.forEach { menuCase in
//            menu.append(String(menuCase))
//        }

        return ["Whisper", "Shout", "Whistle", "None"]
    }
    
    // MARK: - Services
    func showMessage(withWhisperMenuCase menuCase: WhisperMenuCase) {
        switch menuCase {
        case .whisper:
            showMessage(withType: .whisper)
        case .shout:
            showMessage(withType: .shout)
        case .whistle:
            showMessage(withType: .whistle)
        case .none:
            return
        }
    }
    
}

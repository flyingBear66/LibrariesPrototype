//
//  Application.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class Application {
    
    // MARK: - Dependencies
    private let window: LTWindow
    lazy var navigation: Navigation = Navigation(
        window: self.window
    )

    // MARK: - Lifecycle
    init(window: LTWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
}

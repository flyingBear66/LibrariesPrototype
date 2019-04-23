//
//  GradientProgressMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum GradientProgressBarMenuCase: Int {
    case button = 0
    case statusBar = 1
    case statusBarWithSafe = 2
    case none = -1
}

protocol GradientProgressMainViewModelEvents {
    var showButtonScreens: (() -> Void)? {get set}
    var showStatusBarScreens: (() -> Void)? {get set}
    var showStatusBarWithSafeAreaScreens: (() -> Void)? {get set}
}

class GradientProgressMainViewModel: LTViewModel {

    // MARK: - Events
    var showButtonScreens: (() -> Void)?
    var showStatusBarScreens: (() -> Void)?
    var showStatusBarWithSafeAreaScreens: (() -> Void)?

    // MARK: - Variables
    public var menus: [String] {
        get {
            return self.getMenus()
        }
    }

    // MARK: - Init

    // MARK: - Services
    private func getMenus() -> [String] {
        return ["button", "status bar", "status bar with safe area"]
    }

    // MARK: - Helpers
}

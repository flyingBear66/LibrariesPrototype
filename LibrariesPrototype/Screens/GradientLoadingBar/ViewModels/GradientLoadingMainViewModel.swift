//
//  GradientLoadingMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 23/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum GradientLoadingBarMenuCase: Int {
    case button = 0
    case statusBar = 1
    case statusBarWithSafe = 2
    case none = -1
}

protocol GradientLoadingMainViewModelEvents {
    var showButtonScreens: (() -> Void)? {get set}
    var showStatusBarScreens: (() -> Void)? {get set}
    var showStatusBarWithSafeAreaScreens: (() -> Void)? {get set}
}

class GradientLoadingMainViewModel: LTViewModel {
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
    func openScreen(withIndexPath indexPath: IndexPath) {
        let menuIndex = GradientLoadingBarMenuCase(rawValue: indexPath.row) ?? .none
        switch menuIndex {
        case .button:
            showButtonScreens!()
        case .statusBar:
            showStatusBarScreens!()
        case .statusBarWithSafe:
            showStatusBarWithSafeAreaScreens!()
        case .none:
            print("Default case. Error happened or index not exist")
        }
    }
}

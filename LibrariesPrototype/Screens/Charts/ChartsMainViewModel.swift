//
//  ChartsMainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 18/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import UIKit

enum ChartsMenuCase: Int {
    case lineFirst = 0
    case lineSecond
    case lineCubic
    case none
}

protocol ChartsMainViewModelEvents {
    var showLineFirst: (() -> Void)? {get set}
    var showLineSecond: (() -> Void)? {get set}
    var showLineCubic: (() -> Void)? {get set}
}

class ChartsMainViewModel: LTViewModel, ChartsMainViewModelEvents {

    // MARK: - Events
    var showLineFirst: (() -> Void)?
    var showLineSecond: (() -> Void)?
    var showLineCubic: (() -> Void)?

    // MARK: - Variables
    public var menus: [String] {
        get {
            return self.getMenus()
        }
    }

    // MARK: - Services
    private func getMenus() -> [String] {
        return ["Line First",
                "Line Second",
                "Line Cubic"]
    }

    // MARK: - Helpers
    func openScreen(withIndexPath indexPath: IndexPath) {
        let menuIndex = ChartsMenuCase(rawValue: indexPath.row) ?? .none
        switch menuIndex {
        case .lineFirst:
            showLineFirst!()
        case .lineSecond:
            showLineSecond!()
        case .lineCubic:
            showLineCubic!()
        case .none:
            print("Default case. Error happened or index not exist")
        }
    }
}

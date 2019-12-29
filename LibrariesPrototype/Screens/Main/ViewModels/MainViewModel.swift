//
//  MainViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum MenuCase: Int {
    case nativeNetworking = 0
    case emptyDataSet = 1
    case rxSwift = 2
    case gradientProgressBar = 3
    case stretchyHeader = 4
    case none = -1
}

protocol MainViewModelEvents {
    var showNativeNetworkingScreens: (() -> Void)? {get set}
    var showEmptyDataSet: (() -> Void)? {get set}
    var showRxSwiftScreens: (() -> Void)? {get set}
    var showGradientLoadingBarScreens: (() -> Void)? {get set}
    var showStretchyHeaderScreens: (() -> Void)? {get set}
}

class MainViewModel: LTViewModel, MainViewModelEvents {
    // MARK: - Events
    var showNativeNetworkingScreens: (() -> Void)?
    var showEmptyDataSet: (() -> Void)?
    var showRxSwiftScreens: (() -> Void)?
    var showGradientLoadingBarScreens: (() -> Void)?
    var showStretchyHeaderScreens: (() -> Void)?

    // MARK: - Variables
    private let service: MainService!
    public var menus: [String] {
        get {
            return self.getMenus()
        }
    }
    
    // MARK: - Init
    init(withService service: MainService) {
        self.service = service
    }
    
    // MARK: - Services
    private func getMenus() -> [String] {
        return ["Native Networking Test with MarvelAPI", "Empty Data Set List", "RxSwift and Alamofire Screens", "Gradient Progress Bar", "Stretchy Header CollectionView"]
    }
    
    // MARK: - Helpers
    func openScreen(withIndexPath indexPath: IndexPath) {
        let menuIndex = MenuCase(rawValue: indexPath.row) ?? .none
        switch menuIndex {
        case .nativeNetworking:
            showNativeNetworkingScreens!()
        case .emptyDataSet:
            showEmptyDataSet!()
        case .rxSwift:
            showRxSwiftScreens!()
        case .gradientProgressBar:
            showGradientLoadingBarScreens!()
        case .stretchyHeader:
            showStretchyHeaderScreens!()
        case .none:
            print("Default case. Error happened or index not exist")            
        }
    }
}

//
//  MainEmptyDataSetListViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/21/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

enum EmptyDataSetMenuCase: Int {
    case list = 0
    case listWithImage = 1
    case listWithButton = 2
    case none = -1
}

protocol MainEmptyDataSetListViewModelEvents {
    var showEmptyDataSetList: (() -> Void)? {get set}
    var showEmptyDataSetListWithButton: (() -> Void)? {get set}
    var showEmptyDataSetListWithImage: (() -> Void)? {get set}
}
    
class MainEmptyDataSetListViewModel: LTViewModel, MainEmptyDataSetListViewModelEvents {
    // MARK: - Events
    var showEmptyDataSetList: (() -> Void)?
    var showEmptyDataSetListWithButton: (() -> Void)?
    var showEmptyDataSetListWithImage: (() -> Void)?
    
    // MARK: - Helpers
    func openScreen(withIndexPath indexPath: IndexPath) {
        let menuIndex = EmptyDataSetMenuCase(rawValue: indexPath.row) ?? .none
        switch menuIndex {
        case .list:
            showEmptyDataSetList!()
        case .listWithImage:
            showEmptyDataSetListWithImage!()
        case .listWithButton:
            showEmptyDataSetListWithButton!()
        case .none:
            print("Default case")
        }
    }
}

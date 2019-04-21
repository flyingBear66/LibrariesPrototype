//
//  HeroListViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

public enum HeroScreens {
    case detail
    case search
}

// TODO: make it work with favorited closures.
// typealias FavoritedClosure = (Bool) -> Void

protocol HeroListViewModelEvents {
    var showHeroDetail: ((Int) -> Void)? {get set}
    var showHeroSearch: (() -> Void)? {get set}
}

class HeroListViewModel: LTViewModel, HeroListViewModelEvents {

    // MARK: - Events
    var showHeroDetail: ((Int) -> Void)?
    var showHeroSearch: (() -> Void)?
    
    // MARK: - Variables
    private let service: HeroListService!
    private var heros: [ComicCharacter]?
    public var heroCellViewModels = Bindable<[HeroCellViewModel]>([])
    public var herosDidError = Bindable<String>("")

    // MARK: - Init
    init(withService service: LTService) {
        self.service = (service as! HeroListService)
    }
    
    // MARK: - Services
    func getHeros() {
        loading.value = true
        self.service.getHeros { result in
            self.loading.value = false
            switch result {
            case .success(let heros):
                self.heros = heros
                self.heroCellViewModels.value = self.getHeroCellViewModels(with: heros)
            case .failure(let error):
                self.herosDidError.value = error.localizedDescription
            }
        }
    }
    
    func getMoreHeros() {
        loading.value = true
        self.service.getMoreHeros { result in
            self.loading.value = false
            switch result {
            case .success(let heros):
                self.heros = self.heros! + heros
                self.heroCellViewModels.value += self.getHeroCellViewModels(with: heros)
            case .failure(let error):
                self.herosDidError.value = error.localizedDescription
            }
        }
    }

    // MARK: - Helpers
    func getHeroCellViewModels(with heros: [ComicCharacter]) -> [HeroCellViewModel] {
        return heros.map({ hero -> HeroCellViewModel in
            HeroCellViewModel(hero: hero)
        })
    }

    // MARK: - Publics
    func openScreen(withHeroScreen heroScreen: HeroScreens, selectedIndexPath indexPath: IndexPath? = nil) {
        switch heroScreen {
        case .detail:
            guard let indexPath = indexPath else {
                assertionFailure("indexPath should be filled")
                return
            }
            let selectedCellViewModel = heroCellViewModels.value[indexPath.row]
            self.showHeroDetail!(selectedCellViewModel.heroId)
            
            // TODO: make it work with favorited closures.
//            self.showHeroDetail!(selectedCellViewModel.heroId) { favorited in
//                DispatchQueue.main.async {
//                    selectedCellViewModel.favorited.value = favorited
//                }
//            }
        case .search:
            self.showHeroSearch!()
        }
    }
}

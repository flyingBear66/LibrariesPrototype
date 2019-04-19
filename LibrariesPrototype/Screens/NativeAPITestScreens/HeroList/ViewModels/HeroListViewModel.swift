//
//  HeroListViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/2/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroListViewModel: LTViewModel {
    
    // MARK: - Variables
    private let service: HeroListService!
    private var heros: [ComicCharacter]?
    public var heroCellViewModels = Bindable<[HeroCellViewModel]>([])
    public var herosDidError = Bindable<String>("")

    // MARK: - Init
    init(with service: BaseService) {
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

}

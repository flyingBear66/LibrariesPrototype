//
//  HeroSearchViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/8/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroSearchViewModel: LTViewModel {
    // MARK: - Variables
    private let service: HeroSearchService!
    private var heros: [ComicCharacter]?
    public var searchHeroCellViewModels = Bindable<[HeroCellViewModel]>([])
    public var searchHerosDidError = Bindable<String>("")
    
    // MARK: - Init
    init(withService service: LTService) {
        self.service = (service as! HeroSearchService)
    }
    
    // MARK: - Services
    func getHeros(with name: String) {
        loading.value = true
        self.service.getHeros(with: name) { result in
            self.loading.value = false
            switch result {
            case .success(let heros):
                self.heros = heros
                self.searchHeroCellViewModels.value = self.getHeroCellViewModels(with: heros)
            case .failure(let error):
                self.searchHerosDidError.value = error.localizedDescription
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

//
//  HeroCellViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Emre Zor on 04/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import Foundation

class HeroCellViewModel: LTViewModel {
    // MARK: - Variables
    private let hero: ComicCharacter
    public let heroImageURLString: String
    public let heroName: String
    public var heroId: Int {
        get {
            return self.hero.id
        }
    }
    
    public let favorited = Bindable<Bool>(false)

    // MARK: - Init
    init(hero: ComicCharacter) {
        self.hero = hero
        self.heroName = hero.name ?? "N/a"
        if let thumbnail = hero.thumbnail {
            self.heroImageURLString = thumbnail.url.absoluteString
        } else {
            self.heroImageURLString = ""
        }
        favorited.value = UserDefaults.standard.bool(forKey: "\(self.hero.id)")
    }
    
    // MARK: - Public Methods
    func favoriteTapped() {
        UserDefaults.standard.set(!favorited.value, forKey: "\(hero.id)")
        favorited.value = UserDefaults.standard.bool(forKey: "\(hero.id)")
    }
}

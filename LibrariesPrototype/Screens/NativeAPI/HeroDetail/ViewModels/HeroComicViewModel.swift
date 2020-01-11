//
//  HeroComicViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroComicViewModel: LTViewModel {
    // MARK: - Variables
    private let comic: Comic
    public let title: String
    public let comicDescription: String
    
    // MARK: - Init
    init(comic: Comic) {
        self.comic = comic
        self.title = comic.title ?? EmptyStateStrings.heroDetail
        if let comicDescription = comic.description {
            self.comicDescription = comicDescription.isEmpty ? EmptyStateStrings.heroDetail : comicDescription
        } else {
            self.comicDescription = EmptyStateStrings.heroDetail
        }
    }
}

//
//  HeroSerieViewModel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/4/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroSerieViewModel: LTViewModel {

    // MARK: - Variables
    private let serie: Serie
    public let title: String
    public let serieDescription: String
    
    // MARK: - Init
    init(serie: Serie) {
        self.serie = serie
        self.title = serie.title ?? EmptyStateStrings.heroDetail
        if let serieDescription = serie.description {
            self.serieDescription = serieDescription.isEmpty ? EmptyStateStrings.heroDetail : serieDescription
        } else {
            self.serieDescription = EmptyStateStrings.heroDetail
        }
    }
    
}

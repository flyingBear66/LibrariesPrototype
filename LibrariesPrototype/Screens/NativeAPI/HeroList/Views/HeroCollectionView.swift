//
//  HeroCollectionView.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/8/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class HeroCollectionView: LTCollectionView {
    init() {
        let heroCollectionViewLayout = HeroListCollectionViewLayout()
        super.init(frame: .zero, collectionViewLayout: heroCollectionViewLayout)
        backgroundColor = .clear
        register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: HeroCellIdentifiers.heroCell)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

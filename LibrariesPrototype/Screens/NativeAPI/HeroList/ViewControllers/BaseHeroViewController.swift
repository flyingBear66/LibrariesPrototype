//
//  BaseHeroViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/8/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class BaseHeroViewController: LTViewController {
    // MARK: - UIControls
    let collectionView: HeroCollectionView = {
        let collectionView = HeroCollectionView()
        return collectionView
    }()
    
    var selectedCell: HeroCollectionViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

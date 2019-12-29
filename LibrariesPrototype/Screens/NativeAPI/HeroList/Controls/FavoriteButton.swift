//
//  FavoriteButton.swift
//  MarvelAPIAppZor
//
//  Created by Ozgun Zor on 4/6/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class FavoriteButton: LTButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("Star", for: .normal)
        setTitle("Starred", for: .selected)
//        setImage(UIImage(named: "StarImage"), for: .normal)
//        setImage(UIImage(named: "StarFilledImage"), for: .selected)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

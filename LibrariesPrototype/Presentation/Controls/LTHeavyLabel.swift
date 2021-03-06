//
//  LTHeavyLabel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 28/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class LTHeavyLabel: LTLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        textColor = .white
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LTLightLabel.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 28/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class LTLightLabel: LTLabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 15, weight: .light)
        textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

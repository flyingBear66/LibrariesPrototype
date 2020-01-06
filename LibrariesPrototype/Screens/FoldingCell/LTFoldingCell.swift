//
//  LTFoldingCell.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 04/01/2020.
//  Copyright © 2020 Ozgun Zor. All rights reserved.
//

import FoldingCell
import UIKit

class LTFoldingCell: FoldingCell {
    var number: Int = 0
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func animationDuration(_ itemIndex: NSInteger, type: AnimationType) -> TimeInterval {
        // durations count equal it itemCount
        let durations = [0.33, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
}

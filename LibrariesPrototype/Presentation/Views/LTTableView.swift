//
//  LTTableView.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class LTTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        tableFooterView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

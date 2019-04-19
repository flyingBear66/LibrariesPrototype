//
//  LTViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

class LTViewController: UIViewController {
    
    // MARK: - UIControls
    var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - View LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
//
//  LTViewController.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor on 4/19/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import CocoaLumberjack
import GradientLoadingBar
import UIKit

class LTViewController: UIViewController {
    // MARK: - UIControls
    let gradientLoadingBar = GradientLoadingBar(height: GradientLoadingBarConstants.height,
                                                isRelativeToSafeArea: false)

    // MARK: - View LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("\(String(describing: self)) viewDidLoad")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideGradientLoadingBar()
    }
}

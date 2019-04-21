//
//  BaseViewController+ActivitiyIndicator.swift
//  MarvelAPIAppZor
//
//  Created by Ozgun Zor on 4/6/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit
import SVProgressHUD

extension LTViewController {
        
    public func showLoadingIndicator() {
        SVProgressHUD.show()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    public func hideLoadingIndicator() {
        SVProgressHUD.dismiss()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
}

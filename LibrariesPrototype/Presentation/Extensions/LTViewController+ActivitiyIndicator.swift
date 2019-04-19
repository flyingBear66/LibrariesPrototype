//
//  BaseViewController+ActivitiyIndicator.swift
//  MarvelAPIAppZor
//
//  Created by Ozgun Zor on 4/6/19.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import UIKit

extension LTViewController {
        
    public func showLoadingIndicator() {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator?.center = (view?.center)!
        view?.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    public func hideLoadingIndicator() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
}

//
//  AppDelegateHelper.swift
//  LibrariesPrototype
//
//  Created by Ozgun Zor Personal on 25/04/2019.
//  Copyright © 2019 Ozgun Zor. All rights reserved.
//

import AlamofireNetworkActivityLogger
import Foundation

struct AppDelegateHelper {
    
    
    static func setupLibrariesOnLaunch() {
        AppDelegateHelper.setupAlamofireNetworkLogger()
    }
    
    private static func setupAlamofireNetworkLogger() {
        NetworkActivityLogger.shared.startLogging()
    }
}
